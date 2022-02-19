
exception Invalid
(* Specification of Values *)
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
  | Newpair_exp of expression * expression
  | Left_exp of expression
  | Right_exp	of expression
  | Setleft_exp of expression * expression
  | Setright_exp of expression * expression

type program = Expression of expression 

type procedure = {
	var : var;
	body : expression;
	saved_env : env;
}
and env = Empty_env | Extend_env of var * reference * env
and exp_value = ExpVal of int | ExpBool of bool | Proc of procedure | MutPair of mut_pair
and mut_pair = {
	left_loc: reference;
	right_loc: reference;
}

type den_value = Ref of reference
let empty_env () : env = Empty_env

let extend_env (v:var) (refNum:reference) (e:env) : env = 
  Extend_env(v, refNum, e)

let rec apply_env(e:env) (search_v:var) : reference = 
  match e with
  | Empty_env -> raise Invalid
  | Extend_env(variable, value, envNext) -> if variable = search_v then value 
		else apply_env envNext search_v
                                                        

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

    
let num_val (i:int) : exp_value = 
  ExpVal(i)
let bool_val (b:bool) : exp_value = 
  ExpBool(b)
let proc_val (p:procedure) : exp_value = 
  Proc(p)
let mutpair_val (m:mut_pair) : exp_value = 
	MutPair(m)


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
let expval_to_mutpair (value:exp_value) : mut_pair =
	match value with
  | MutPair(m) -> m
  | _ -> raise Invalid


let procedure (v:var) (body:expression) (environment:env) : procedure = 
  {var = v;
  body = body;
  saved_env = environment;}


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

(* Functions for mutable pairs------------------------------------------------------- *)
let make_pair (val1:exp_value) (val2:exp_value) : mut_pair =
	{left_loc = (newref val1);
	right_loc = (newref val2);}
let left (pair:mut_pair) : exp_value =
	deref pair.left_loc
let right (pair:mut_pair) : exp_value =
	deref pair.right_loc
let setleft (pair:mut_pair) (value:exp_value) =
	if setref pair.left_loc value then 
	print_string "Left pair value set success" else
	raise (Failure "Assignment failure")
let setright (pair:mut_pair) (value:exp_value) =
	if setref pair.right_loc value then 
	print_string "Right pair value set success" else
	raise (Failure "Assignment failure")

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
	| Newpair_exp(exp1,exp2) -> mutpair_val (make_pair (value_of exp1 environment) (value_of exp2 environment))
	| Left_exp(exp1) -> let val1 = value_of exp1 environment in
		let pair = expval_to_mutpair val1 in
			left pair
	| Right_exp(exp1) -> let val1 = value_of exp1 environment in
		let pair = expval_to_mutpair val1 in
			right pair
	| Setleft_exp(exp1,exp2) -> let val1 = value_of exp1 environment in
		let val2 = value_of exp2 environment in
			let pair = expval_to_mutpair val1 in
				setleft pair val2;
				num_val 82
	| Setright_exp(exp1,exp2) -> let val1 = value_of exp1 environment in
		let val2 = value_of exp2 environment in
			let pair = expval_to_mutpair val1 in
				setright pair val2;
				num_val 82				

let value_of_program (p:program) : int = 
  match p with
  | Expression(exp) -> let init_env = empty_env() in
      expval_to_num (value_of exp init_env)


(* figure 4.11 example on pg 127 returns 88*)
let example_run () = 
	let p = Let_exp("glo", Newpair_exp(Const_exp(11),Const_exp(22)),
						Let_exp("f", Proc_exp("loc", Let_exp("d1", Setright_exp(Var_exp("loc"), Left_exp(Var_exp("loc"))),
							Let_exp("d2", Setleft_exp(Var_exp("glo"), Const_exp(99)),
								Diff_exp(Left_exp(Var_exp("loc")),Right_exp(Var_exp("loc")))))),
					Call_exp(Var_exp("f"), Var_exp("glo"))))
	in print_int (value_of_program (Expression(p))) 

let () = example_run()