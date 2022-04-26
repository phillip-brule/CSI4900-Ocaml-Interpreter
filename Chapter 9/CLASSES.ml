
exception Invalid
(*---------- Specification of Values -----------------*)
type reference = int
type var = string 
type className = ClassName of var
type methodName = MethodName of var
type expression = 
  | Zero_exp of expression
  | Const_exp of int
  | Diff_exp of expression * expression
  | Var_exp of var
  | If_exp of expression * expression * expression
  | Let_exp of var * expression * expression
  | Proc_exp of var * expression
  | Call_exp of expression * expression  (* operator operand *)
  | Assign_exp of var * expression
  | Letrec_exp of var * var * expression * expression (*proc-name bound-variable proc-body letrec-body*)
  | Begin_exp of expression list
  | New_object_exp of className * expression list
  | Method_call_exp of expression * var * expression list (*send expression*)
  | Super_call_exp of methodName * expression list
  | Self_exp



type method_decl = {
	method_name: methodName;
	variables: var list;
	body: expression;
}

let method_declaration (m_name:var) (vars: var list) (b:expression) : method_decl = 
	{method_name = MethodName(m_name); variables = vars; body = b;}
(* class class_declaration *)
type class_decl = {
	class_name: className;
	super_class: className;
	field_names: var list;
	method_decls: method_decl list;
}

let class_declaration (c_name:var) (s_name:var) (vars: var list) (methods:method_decl list) : class_decl = 
	{class_name = ClassName(c_name); super_class = ClassName(s_name); field_names = vars; method_decls = methods;}

type object_inst = {
	class_name : className;
	fields : reference list;
}

type program = Program of class_decl list * expression 

type procedure = {
	var : var;
	body : expression;
	saved_env : env;
}

and env = Empty_env | Extend_env of var * reference * env | Extend_env_rec of var * var * expression * env | Extend_env_list of var list * reference list * env
and exp_value = ExpVal of int | ExpBool of bool | Proc of procedure | EmptyObjField of var | Obj of object_inst

type den_value = Ref of reference

(* an array may not the best use for this because everytime an end insert is need, in order to append
to the end of the array ocaml will reconstruct a new array and return a new array rather than just
extending the current array which is slower and if the memory is not delt with properly will use 
extraneeous memory *)
(* Because of this new data will be inserted at front of reference list *)
(* A reference is its location in the reference list *)

(* a store is just a reference list *)
(* this could be implemented either with a mutable record or a ocaml ref. The advantable of a 
mutable record is that other fields that describe the store could be added later *)
type store = {mutable store : exp_value array}

(* object instance *)


type methodType = {
	vars : var list;
	body : expression;
	super_name : className;
	field_names : var list;
}

type methodEnv = (methodName * methodType) list

type classType = {
	super_name : className;
	field_names : var list;
	method_env : methodEnv;
}

type classEnv = (className * classType) list

(* -------Helper Functions for Data Types------------- *)

(* initialize class environment *)
let the_class_env : classEnv ref = ref []

let empty_env () : env = Empty_env

let self : object_inst ref = ref { class_name = ClassName("object"); fields = [];}
let super : className ref = ref (ClassName("#f"))

let extend_env (v:var) (refNum:reference) (e:env) : env = 
  Extend_env(v, refNum, e)
let extend_env_rec (proc_name:var) (bound_var:var) (proc_body:expression) (e:env) : env = 
	Extend_env_rec(proc_name, bound_var, proc_body, e)
let extend_env_list (vars:var list) (values:reference list) (e:env) : env = 
	Extend_env_list(vars, values, e)
let extend_env_with_self_and_super (new_self:object_inst) (new_super:className) (e:env) : env = 
	self := new_self; super := new_super; e

let empty_store () : store = 
	let (listOfReferences: exp_value array) = [||] in
		{store = listOfReferences;}

let new_class (s_name:className) (f_names: var list) (m_env:methodEnv) : classType = 
	{super_name = s_name;
	field_names = f_names;
	method_env = m_env;}

let new_method (variables:var list) (new_body:expression) (s_name:className) (f_names:var list) : methodType = 
	{vars = variables;
	body = new_body;
	super_name = s_name;
	field_names = f_names;}

let fresh_identifier (old_var_name:var) : var = 
	if String.contains old_var_name '%' then (let s_new = String.split_on_char '%' old_var_name in 
		match s_new with 
		| [] -> "%1"
		| var_name :: num_string :: _ -> let num =  int_of_string num_string in var_name ^ ("%" ^ (string_of_int (num + 1)))
		| _ :: [] -> old_var_name ^ "%1"
	) else old_var_name ^ "%1"


let rec append_field_names (super_fields: var list) (new_fields: var list) : var list = 
	match super_fields with
	| [] -> new_fields
	| head :: tail -> let new_tail = append_field_names tail new_fields in
			if List.mem head new_fields then (fresh_identifier head) :: new_tail else head :: new_tail

let add_to_class_env (class_n:className) (class_obj:classType) = 
	the_class_env := (class_n,class_obj) :: !the_class_env

let lookup_class (search_class_n:className) : classType = 
	match (List.assoc_opt search_class_n !the_class_env) with 
	| None -> raise Invalid
	| Some(class_obj) -> class_obj

(* exercise 9.18 to make merge method envs more efficient for look up and save memory space *)
(* a method in the super environment is replaced with the method in the new environment if they have the same name 
the new method should be placed in the same location as it was before *)
let rec merge_method_envs (super_env:methodEnv) (new_env:methodEnv) : methodEnv = 
	match super_env with 
	| [] -> new_env
	| (m_name, old_method) :: super_tail -> let same_method_name = List.assoc_opt m_name new_env in 
		match same_method_name with 
		| None -> (m_name, old_method) :: merge_method_envs super_tail new_env
		| Some(new_method) -> (m_name, new_method) :: merge_method_envs super_tail (List.remove_assoc m_name new_env)

(* initialize store *)
let global_store = empty_store()

(* method functions *)
let method_decls_to_method_env (m_decls:method_decl list) (s_name:className) (f_names:var list) : methodEnv = 
	List.map (fun (m_decl:method_decl) -> (m_decl.method_name, (new_method m_decl.variables m_decl.body s_name f_names)))
	m_decls

let find_method (c_name:className) (search_v:methodName) : methodType = 
	let the_class = lookup_class c_name in
		let m_env = the_class.method_env in
			let found = List.assoc_opt search_v m_env in
				match found with 
				| Some(the_method) -> the_method
				| None -> raise Invalid


let initialize_class_decl (class_declaration:class_decl) =
	let super_class = lookup_class class_declaration.super_class in
		let f_names = append_field_names (super_class.field_names) class_declaration.field_names in 
			add_to_class_env class_declaration.class_name (new_class class_declaration.super_class f_names (merge_method_envs super_class.method_env 
				(method_decls_to_method_env class_declaration.method_decls class_declaration.super_class f_names)))
(* creationg of the super class for all classes called object *)
let initialize_class_env (class_declarations:class_decl list) = 
	the_class_env := (ClassName("object"), { super_name = ClassName("#f"); field_names = []; method_env = [];}) :: !the_class_env;
	List.iter initialize_class_decl class_declarations


let procedure (v:var) (body:expression) (environment:env) : procedure = 
  {var = v;
  body = body;
  saved_env = environment;}

let num_val (i:int) : exp_value = 
  ExpVal(i)
let bool_val (b:bool) : exp_value = 
  ExpBool(b)
let proc_val (p:procedure) : exp_value = 
  Proc(p)


let expval_to_num (value:exp_value) : int = 
  match value with
  | ExpVal(i) -> i
  | _ -> raise Invalid
let expval_to_bool (value:exp_value) : bool = 
	match value with
  | ExpBool(b) -> b
  | _ -> raise Invalid
let expval_to_proc (value:exp_value) : procedure = 
  match value with
  | Proc(p) -> p
  | _ -> raise Invalid

 let expval_to_obj (value:exp_value) :object_inst = 
  match value with
  | Obj(o) -> o 
  | _ -> raise Invalid


(* reference number is equal to its location *)
let newref (value:exp_value)  : reference = 
	global_store.store <- Array.append global_store.store [|value|];
		(Array.length global_store.store) - 1

let deref (refNum: reference) : exp_value = 
	global_store.store.(refNum)

(* returns false if setting reference is unsuccessful *)
let setref (refNum: reference) (value: exp_value) : bool = 
	try
		global_store.store.(refNum) <- value;
			true
	with
		Invalid_argument(_) -> false


let rec apply_env(e:env) (search_v:var) : reference = 
  match e with
  | Empty_env -> raise Invalid
  | Extend_env(variable, value, envNext) -> if variable = search_v then value 
		else apply_env envNext search_v
	| Extend_env_rec(proc_name, bound_var, proc_body, envNext) -> if proc_name = search_v then newref (proc_val (procedure bound_var proc_body e))
		else apply_env envNext search_v
	| Extend_env_list(vars, values, envNext) -> 
		match values with
		| [] -> apply_env envNext search_v
		| value_head :: value_tail ->
			match vars with
			| [] -> apply_env envNext search_v
			| head :: tail -> if head = search_v then value_head else apply_env (extend_env_list tail value_tail envNext) search_v

let new_object (class_n:className) : object_inst = 
	let field_list = let the_class =  lookup_class class_n in List.map (fun f_name -> newref (EmptyObjField(f_name))) the_class.field_names in
	{
		class_name = class_n;
		fields = field_list;
	}



(* -------------Evaluation-------------------- *)

let rec value_of (exp:expression) (environment:env) : exp_value = 
	match exp with
	| Const_exp(constant_n) -> num_val constant_n 
	| Var_exp(variable) -> deref (apply_env environment variable)
	| Diff_exp(exp1,exp2) -> let val1 = expval_to_num (value_of exp1 environment) in
		let val2 = expval_to_num (value_of exp2 environment) in 
		num_val (val1 - val2)
	| Zero_exp(exp1) -> let value = expval_to_num (value_of exp1 environment) in
		if value = 0 then bool_val true else bool_val false
	| If_exp(exp1,exp2,exp3) -> let value = value_of exp1 environment in 
		begin match value with
		| ExpBool(true) -> value_of exp2 environment 
		| ExpBool(false) -> value_of exp3 environment
		| _ -> raise Invalid
	end
	| Let_exp(variable, exp1, body) ->
		value_of body (extend_env variable (newref (value_of exp1 environment)) environment)
			(* creates procedure in context of current environment *)
	| Proc_exp(var, body) -> proc_val (procedure var body environment)
	(* type check to make sure a proc is the operator but said proc has to be evaluted first *)
	| Call_exp(operator, operand) -> let proc = expval_to_proc (value_of operator environment) in 
		let arg = value_of operand environment in 
		let apply_procedure (p:procedure) (value:exp_value) : exp_value = 
  			value_of p.body (extend_env p.var (newref value) p.saved_env) in
					apply_procedure proc arg
	| Assign_exp(var, exp1) -> if setref (apply_env environment var) (value_of exp1 environment) then print_string "Varriable Assignment Success  " else raise (Failure "variable assignment failure");
		num_val 27
	| Letrec_exp(proc_name, bound_var, proc_body, letrec_body) -> let newEnv = extend_env_rec proc_name bound_var proc_body environment in
		value_of letrec_body newEnv
	| Begin_exp(exp_list) ->
		begin match exp_list with
		| [] -> raise Invalid
		| [last_exp] -> value_of last_exp environment
		| head :: tail -> let _throw = value_of head environment in (); 
			value_of (Begin_exp(tail)) environment
	end
	| Self_exp -> Obj(!self) (*self refers to the current bound object*)
	| Method_call_exp(object_exp, method_name, operands) -> let args = values_of_exps operands environment in
		let obj = expval_to_obj (value_of object_exp environment) in
			apply_method (find_method (obj.class_name) (MethodName(method_name))) obj args
	| Super_call_exp(method_name, operands) -> let args = values_of_exps operands environment in
		let obj = !self in
			apply_method (find_method (!super) method_name) obj args
	| New_object_exp(class_name, operands) -> let args = values_of_exps operands environment in
		let obj = new_object class_name in 
		(* all classes need an initialize method called by keywork init which is called everytime a new object is created*)
			let _throw = apply_method (find_method class_name (MethodName("init"))) obj args in Obj(obj) 


and apply_method (m:methodType) (self:object_inst) (args:exp_value list) : exp_value = 
	value_of m.body (extend_env_list m.vars (List.map newref args) 
		(extend_env_with_self_and_super self m.super_name (extend_env_list m.field_names self.fields (empty_env ()))))

and values_of_exps (rands:expression list) (environment:env) : exp_value list = 
	match rands with
	| [] -> []
	| head :: tail -> (value_of head environment) :: (values_of_exps tail environment)


let value_of_program (p:program) : exp_value = 
  match p with
  | Program(class_declarations, body) -> 
  	initialize_class_env class_declarations;
  	let init_env = empty_env() in
  		value_of body init_env

let test_classes = 
	let temp_methods = [(method_declaration "init" ["x"] (Begin_exp([Assign_exp("i", Var_exp("x"));
																										Assign_exp("j", Diff_exp(Const_exp(0), Var_exp("x")))])));
											(method_declaration "geti" [] (Var_exp("i")))]
		in let temp = class_declaration "c1" "object" ["i";"j"] temp_methods in [temp]

let () = print_int(expval_to_num(value_of_program(Program(test_classes, Let_exp("o1", New_object_exp(
			ClassName("c1"), [Const_exp(3)]), 
 	Method_call_exp(Var_exp("o1"), "geti", []))))
	))
(* 
class c1 extends object
	field i;
	field j
	method init (x) 
		begin
		set i = x;
		set j = (0 - x)
		end
	;
	method geti () i
;
let o1 = new c1(3) in 
send o1.geti() *)