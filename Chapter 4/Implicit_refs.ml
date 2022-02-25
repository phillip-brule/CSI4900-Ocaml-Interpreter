
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

type program = Expression of expression 

type procedure = {
	var : var;
	body : expression;
	saved_env : env;
}
and env = Empty_env | Extend_env of var * reference * env
and exp_value = ExpVal of int | ExpBool of bool | Proc of procedure

type den_value = Ref of reference
let empty_env () : env = Empty_env

let extend_env (v:var) (refNum:reference) (e:env) : env = 
  Extend_env(v, refNum, e)

let rec apply_env(e:env) (search_v:var) : reference = 
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



let value_of_program (p:program) : int = 
  match p with
  | Expression(exp) -> let init_env = empty_env() in
      expval_to_num (value_of exp init_env)


(* figure 4.8 on page 120 returns 12*)
(* Note: to express parts of code that have procedures with multiple operations, Let expressions may be used for 
each operation. The body of the final let expression will be the return value *)
(* let f = proc (x) proc (y)
	begin 
		set x = -(x,-1);
		-(x,y)
	end 
in ((f 44) 33) *)
let example_run () = 
	let p = Let_exp("f", Proc_exp("x", Proc_exp("y", 
		Let_exp("result", Assign_exp("x", Diff_exp(Var_exp("x"), Const_exp(-1))), Diff_exp(Var_exp("x"), Var_exp("y")) ))),
		Call_exp(Call_exp(Var_exp("f"),Const_exp(44)), Const_exp(33)))
	in print_int (value_of_program (Expression(p))) 

let () = example_run()