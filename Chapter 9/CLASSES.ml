
exception Invalid
(*---------- Specification of Values -----------------*)
type reference = int
type var = string 
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
  | New_object_exp of var * expression list
  | Method_call_exp of expression * var * expression list (*send expression*)
  | Super_call_exp of var * expression list
  | Self_exp

type method_decls = {
	method_name: var;
	variables: var list;
	body: expression;
}

type class_decl = {
	class: var;
	super_class: var;
	field_names: var list;
	method_decls: method_decl list;
}

type program = Program of class_decl list * expression 

type procedure = {
	var : var;
	body : expression;
	saved_env : env;
}

and env = Empty_env | Extend_env of var * reference * env | Extend_env_rec of var * var * expression * env 
and exp_value = ExpVal of int | ExpBool of bool | Proc of procedure | ExpValList of exp_value list | Obj of object_inst

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


type object_inst = {
	class_name : var;
	fields : reference list;
}


(* -------Helper Functions for Data Types------------- *)

let empty_env () : env = Empty_env

let extend_env (v:var) (refNum:reference) (e:env) : env = 
  Extend_env(v, refNum, e)
let extend_env_rec (proc_name:var) (bound_var:var) (proc_body:expression) (e:env) : env = 
	Extend_env_rec(proc_name, bound_var, proc_body, e)

let empty_store () : store = 
	let (listOfReferences: exp_value array) = [||] in
		{store = listOfReferences;}

(* initialize store *)
let global_store = empty_store()

 
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


let new_object (class_n:var) : object_inst = 
	let field_list = newref (class_to_field_names (lookup_class class_n)) in
	{
		class_name = class_n;
		fields = field_list
	}


let rec apply_env(e:env) (search_v:var) : reference = 
  match e with
  | Empty_env -> raise Invalid
  | Extend_env(variable, value, envNext) -> if variable = search_v then value 
		else apply_env envNext search_v
	| Extend_env_rec(proc_name, bound_var, proc_body, envNext) -> if proc_name = search_v then proc_val (procedure bound_var proc_body e)
		else apply_env envNext search_v
 

(*-----------------------Functions for referencing-------------------------- *)
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


let initialize_class_env = kkj





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
	| Self_exp -> apply_env environment self (*self refers to the current bound object*)
	| Method_call_exp(object_exp, method_name, operands) -> let args = values_of_exps operands environment in
		let obj = value_of object_exp environment in
			apply_method (find_method (object_to_class_name obj) method_name) obj args
	| Super_call_exp(method_name, operands) -> let args = values_of_exps operands environment in
		let obj = apply_env environment self in
			apply_method (find_method (apply_env environment super) method_name) obj args
	| New_object_exp(class_name, operands) -> let args = values_of_exps operands environment in
		let obj = new_object class_name in 
			let _throw = apply_method (find_method class_name (initialize_object ())) obj args in obj




let value_of_program (p:program) : exp_value = 
  match p with
  | Program(class_declarations, body) -> 
  	initialize_class_env class_declarations;
  	let init_env = empty_env() in
  		value_of body init_env

