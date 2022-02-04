
exception Invalid

type var = string 
  
type value = int
type env = Empty_env | Extend_env of var * value * env

let empty_env () : env = Empty_env

let extend_env (v:var) (value:value) (e:env) : env = 
  Extend_env(v, value, e)

let rec apply_env(e:env) (search_v:var) : value = 
  match e with
  | Empty_env -> raise Invalid
  | Extend_env(search_v, v, _) -> v
  | Extend_env(_, _ , envNext) -> apply_env envNext sv


type expression = 
  | Zero_exp of expression
  | Const_exp of value
  | Diff_exp of expression * expression
  | Var_exp of var
  | If_exp of expression * expression * expression
  | Let_exp of var * expression * expression
  | Proc_exp of var * expression
  | Call_exp of expression * expression  (* operator operand *)

type procedure = {
	var : var;
	body : expression;
	saved_env : env;
}


(* Specification of Values *)
type exp_value = ExpVal of int | ExpBool of bool | Proc of procedure
type den_value = DenVal of int | DenBool of bool | Proc of procedure
                                                        
type program = Expression of expression 
    
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

let rec value_of (exp:expression) (environment:env) : exp_value = 
	match exp with
	| Const_exp(constant_n) -> num_val constant_n 
	| Var_exp(variable) -> num_val (apply_env environment variable)
	| Diff_exp(exp1,exp2) -> let val1 = expval_to_num (value_of exp1 environment) in
		let val2 = expval_to_num (value_of exp2 environment) in 
		num_val (val1 - val2)
	| Zero_exp(exp1) -> let value = expval_to_num (value_of exp1 environment) in
		if value = 0 then bool_val true else bool_val false
	| If_exp(exp1,exp2,exp3) -> let value = value_of exp1 environment in 
		match value with
		| ExpBool(true) -> value_of exp2 environment 
		| ExpBool(false) -> value_of exp3 environment
		| _ -> raise Invalid
	| Let_exp(variable, exp1, body) ->
		value_of body (extend_env variable (expval_to_num (value_of exp1 environment)) environment)
			(* creates procedure in context of current environment *)
	| Proc_exp(var, body) -> proc_val (procedure var body environment)
	(* type check to make sure a proc is the operator but said proc has to be evaluted first *)
	| Call_exp(operator, operand) -> let proc = expval_to_proc (value_of operator environment) in 
		let arg = value_of operand environment in 
		let apply_procedure (p:procedure) (value:exp_value) : exp_value = 
  			value_of p.body (extend_env p.var (expval_to_num value) p.saved_env) in
		apply_procedure proc arg


let value_of_program (p:program) : value = 
  match p with
  | Expression(exp) -> let init_env = empty_env() in
      expval_to_num (value_of exp init_env)

let run (s:string) : value = 
  s |> scan_and_parse |> value_of_program
