(* Specification of Values *)
exception Invalid

type var = string 

(* Abstract Syntax Tree *)
type expression = 
  | Zero_exp of expression
  | Const_exp of int
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

and env = Empty_env | Extend_env of var * exp_value * env

and exp_value = ExpVal of int | ExpBool of bool | Proc of procedure
                                                        
type program = Expression of expression 


let empty_env () : env = Empty_env

let extend_env (v:var) (value:exp_value) (e:env) : env = 
  Extend_env(v, value, e)

let rec apply_env(e:env) (search_v:var) : exp_value = 
  match e with
  | Empty_env -> raise Invalid
  | Extend_env(variable, value, envNext) -> if variable = search_v then value 
		else apply_env envNext search_v

    
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

let value_of_program (p:program) : int = 
  match p with
  | Expression(exp) -> let init_env = empty_env() in
      expval_to_num (value_of exp init_env)

(* let run (s:string) : int = 
  s |> scan_and_parse |> value_of_program *)

let example_run () = 
	let p = Expression(Let_exp("x", Const_exp(200), Let_exp("f", 
		Proc_exp("z", Diff_exp(Var_exp("z"), Var_exp("x"))),
		Let_exp("x", Const_exp(100), 
			Let_exp("g", Proc_exp("z", Diff_exp(Var_exp("z"), Var_exp("x"))),
				Diff_exp(Call_exp(Var_exp("f"),Const_exp(1)),
					Call_exp(Var_exp("g"),Const_exp(1)))))))) in
	print_int(value_of_program(p))

(* let () = example_run() *)