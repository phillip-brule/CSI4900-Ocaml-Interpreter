type var = string

type program = Expression of expression

type value = int
type env = Empty_env | Extend_env of var * value * env

let empty_env () : env = Empty_env

let extend_env (variable:var) (val:value) (e:env) : env = 
	Extend_env(variable, val, e)

let rec apply_env (e:env) (search_variable:var) : value = 
	match e with
	| Extend_env(search_variable, val, _) -> val
	| Extend_env(_, _, environment) -> apply_env(environment, search_variable)


(* maybe use records?? to label the touples *)
type expression = 
	| Zero_exp of expression
	| Const_exp of int
	| Diff_exp of expression * expression
	| Var_exp of var
	| If_exp of expression * expression * expression
	| Let_exp of var * expression * expression
	| Proc_exp of var * expression
	| Call_exp of expression * expression  

(* Specification of Values *)
type exp_value = ExpVal of int | ExpVal of bool | proc
type den_value = DenVal of int | DenVal of bool | proc
(* maybe just proc should be a record that way in exp_value and den_value can have the constructor Proc *)
type proc = Proc of var * expression * environment

let is_proc (val:exp_value) : bool = 
	match val with
	| Proc(_,_,_) -> true
	| _ -> false

let procedure (v:var) (body:expression) (environment:env) : procedure = 
	Proc(v,body,environment)

let apply_procedure (p:procedure) (val:exp_value) : exp_value = 
	match p with
	| Proc(v,body,saved_env) -> value_of(body, extend_env(v, val, saved_env))

	


let num_val (i:int) : exp_value = 
	ExpVal(i)
let bool_val (b:bool) : exp_value = 
	ExpVal(b)
let proc_val (p:proc) : exp_value = 
	p

(* can we get rid of these functions and just rely on Ocaml to know exp_value can be int or bool *)
let expval_to_num (val:exp_value) : int = 
	match val with
	| ExpVal(i) -> i
	| _ -> error
let expval_to_bool (val:exp_value) : bool = 
	| ExpVal(b) -> b
	| _ -> error
let expval_to_proc (val:exp_value) : proc = 
	if is_proc then val else error
(* Interpreter for PROC language *)

let run (s:string) : value = 
	s |> scan_and_parse |> value_of_program

let value_of_program (p:program) : value = 
	match p with
	| Expression(exp) -> let init_env = empty_env in
		value_of(exp, init_env)

let rec value_of (exp:expression) (environment:env) : exp_value = 
	match exp with
	| Const_exp(constant_n) -> num_val(constant_n)
	| Var_exp(variable) -> num_val(apply_env(environment, variable))
	| Diff_exp(exp1,exp2) -> let val1 = value_of(exp1, environment) in
		let val2 = value_of(exp2, environment) in 
			num_val(val1 - val2)
	| Zero_exp(exp) -> let val = value_of(exp) in
		if val = 0 then bool_val(true) else bool_val(false)
	| If_exp(exp1,exp2,exp3) -> let val = value_of(exp1, environment) in 
		match val with
		| ExpVal(true) -> value_of(exp2,environment)
		| ExpVal(false) -> value_of(exp3,environment)
		| _ -> error
	| Let_exp(variable, exp, body) ->
		value_of(body, extend_env(variable, value_of(exp), environment))
	(* creates procedure in context of current environment *)
	| Proc_exp(var, body) -> proc_val(Proc(var,body,environment)) 
	(* type check to make sure a proc is the operator but said proc has to be evaluted first *)
	| Call_exp(operator, operand) -> let proc = expval_to_proc(value_of(operator, environment)) in 
		let arg = value_of(operand, environment) in 
			apply_procedure(proc, arg)

