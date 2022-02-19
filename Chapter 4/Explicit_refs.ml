(* Specification of Values *)
exception Invalid

type var = string 

type reference = int
type expression = 
  | Zero_exp of expression
  | Const_exp of int
  | Diff_exp of expression * expression
  | Var_exp of var
  | If_exp of expression * expression * expression
  | Let_exp of var * expression * expression
  | Proc_exp of var * expression
  | Call_exp of expression * expression  (* operator operand *)
  | Newref_exp of expression
  | Deref_exp of expression
  | Setref_exp of expression * expression

type program = Expression of expression                                                         
type procedure = {
	var : var;
	body : expression;
	saved_env : env;
}
and env = Empty_env | Extend_env of var * exp_value * env
and exp_value = ExpVal of int | ExpBool of bool | Proc of procedure | Ref of reference
type den_value = exp_value                                                        

let empty_env () : env = Empty_env

let extend_env (v:var) (value:exp_value) (e:env) : env = 
  Extend_env(v, value, e)

let rec apply_env(e:env) (search_v:var) : exp_value = 
  match e with
  | Empty_env -> raise Invalid
  | Extend_env(variable, value, envNext) -> if variable = search_v then value 
		else apply_env envNext search_v


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


let empty_store () : store = 
	let (listOfReferences: exp_value array) = [||] in
		{store = listOfReferences;}


(* initialize store *)
let global_store = empty_store()

let procedure (v:var) (body:expression) (environment:env) : procedure = 
  {var = v;
  body = body;
  saved_env = environment;}


(* Functions for converstions to and from exp_value----------------------------------------------- *)
let num_val (i:int) : exp_value = 
  ExpVal(i)
let bool_val (b:bool) : exp_value = 
  ExpBool(b)
let proc_val (p:procedure) : exp_value = 
  Proc(p)
let ref_val (r:reference) : exp_value = 
	Ref(r)

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
 let expval_to_reference (value:exp_value) : reference = 
 	match value with
 	| Ref(r) -> r
 	| _ -> raise Invalid


(* Functions for referencing---------------------------------------------------- *)
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


let rec value_of (exp:expression) (environment:env) : exp_value = 
	match exp with
	| Const_exp(constant_n) -> num_val constant_n 
	| Var_exp(variable) -> apply_env environment variable
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
	| Let_exp(variable, exp1, body) -> value_of body (extend_env variable (value_of exp1 environment) environment)
(* creates procedure in context of current environment *)
	| Proc_exp(var, body) -> proc_val (procedure var body environment)
	(* type check to make sure a proc is the operator but said proc has to be evaluted first *)
	| Call_exp(operator, operand) -> let proc = expval_to_proc (value_of operator environment) in 
		let arg = value_of operand environment in 
		let apply_procedure (p:procedure) (value:exp_value) : exp_value = 
  			value_of p.body (extend_env p.var value p.saved_env) in
					apply_procedure proc arg
	| Newref_exp(exp1) -> let val1 = value_of exp1 environment in
		ref_val (newref val1)
	| Deref_exp(exp1) -> let val1 = value_of exp1 environment in
		let ref1 = expval_to_reference val1 in
			deref ref1
	(* set ref returns 0 if reference failed and 23 if successful *)
	| Setref_exp(exp1, exp2) -> let ref1 = expval_to_reference (value_of exp1 environment) in
		let val2 = value_of exp2 environment in
			let success = setref ref1 val2 in 
				match success with 
				| true -> num_val 23
				| false ->num_val 0



let value_of_program (p:program) : int = 
  match p with
  | Expression(exp) -> let init_env = empty_env() in
      expval_to_num (value_of exp init_env)


(* example program written on bottom of page 105 returns -1*)
let example_run1 () = 
	let p = Let_exp("counter", Newref_exp(Const_exp(0)), 
		Let_exp("g", Proc_exp("dummy", Setref_exp(Var_exp("counter"), Diff_exp(Deref_exp(Var_exp("counter")), Const_exp(-1)))),
			(* Set c to dereferenced value from g after calling procedure g instead of variable "a"*)
			Let_exp("a", Call_exp(Var_exp("g"), Const_exp(11)), 
				Let_exp("c", Deref_exp(Var_exp("counter")),
					Let_exp("b", Call_exp(Var_exp("g"), Const_exp(11)), 
						Diff_exp(Var_exp("c"), Deref_exp(Var_exp("counter"))) )))))
	in print_int (value_of_program (Expression(p)))

let example_run2 () = 
	let p = Let_exp("g", Newref_exp(Const_exp(0)),
			Let_exp("a", Diff_exp(Deref_exp(Var_exp("g")), Const_exp(2)),
				Let_exp("set", Setref_exp(Var_exp("g"), Var_exp("a")),
					Deref_exp(Var_exp("g")))))
	in print_int (value_of_program (Expression(p))) 

let example_run3 () = 
	let p = Let_exp("g", Newref_exp(Const_exp(0)), Deref_exp(Var_exp("g")))
	in print_int (value_of_program (Expression(p))) 




let () = example_run1()