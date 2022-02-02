type var = string
type value = int
type env = Empty_env | Extend_env of var * value * env

let empty_env () : env = Empty_env

let extend_env (variable:var) (val:value) (e:env) : env = 
	Extend_env(variable, val, e)

let rec apply_env (e:env) (search_variable:var) : value = 
	match e with
	| Extend_env(search_variable, val, _) -> val
	| Extend_env(_, _, environment) -> apply_env(environment, search_variable)



(* LET program structure *)
type program = Expression of expression

(* maybe use records?? to label the touples *)
type expression = 
	| Zero_exp of expression
	| Const_exp of int
	| Diff_exp of expression * expression
	| Var_exp of var
	| If_exp of expression * expression * expression
	| Let_exp of var * expression * expression


(* Interpreter for LET language *)

let run (s:string) : value = 
	s |> scan_and_parse |> value_of_program

let value_of_program (p:program) : value = 
	match p with
	| Expression(exp) -> let init_env = empty_env in
		value_of(exp, env)

let rec value_of (exp:expression) (environment:env) : value = 
	match exp with
	| Const_exp(constant_n) -> constant n
	| Var_exp(variable) -> apply_env(environment, variable)
	| Diff_exp(exp1,exp2) -> let val1 = value_of(exp1, environment) in
		let val2 = value_of(exp2, environment) in 
			val1 - val2
	| Zero_exp(exp) -> let val = value_of(exp) in
		if val = 0 then T else F
	| If_exp(exp1,exp2,exp3) -> let val = value_of(exp1) in 
		match val with
		| Bool(T) -> value_of(exp2)
		| Bool(F) -> value_of(exp3)
	| Let_exp