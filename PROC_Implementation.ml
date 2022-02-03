(* This is an OCaml editor.
   Enter your program here and send it to the toplevel using the "Eval code"
   button or [Ctrl-e]. *)

exception Invalid

type var = string 
  
type value = int
type env = Empty_env | Extend_env of var * value * env

let empty_env () : env = Empty_env

let extend_env (v:var) (value:value) (e:env) : env = 
  Extend_env(v, value, e)

let rec apply_env(e:env) (sv:var) : value = 
  match e with
  | Empty_env -> raise Invalid
  | Extend_env(sv, v, _) -> v
  | Extend_env(_, _ , envNext) -> apply_env(envNext, sv)


type expression = 
<<<<<<< Updated upstream
	| Zero_exp of expression
	| Const_exp of int
	| Diff_exp of expression * expression
	| Var_exp of var
	| If_exp of expression * expression * expression
	| Let_exp of var * expression * expression
	| Proc_exp of var * expression
	| Call_exp of expression * expression  

=======
  | Zero_exp of expression
  | Const_exp of int
  | Diff_exp of expression * expression
  | Var_exp of var
  | If_exp of expression * expression * expression
  | Let_exp of var * expression * expression
  | Proc_exp of var * expression
  | Call_exp of expression * expression  (* operator operand *)

type procedure = Proc of var * expression * env
>>>>>>> Stashed changes
(* Specification of Values *)
type exp_value = ExpVal of int | ExpB of bool | Proc of procedure
type den_value = DenVal of int | DenB of bool | Proc of procedure
                                                        
type program = Expression of expression 
    
let num_val (i:int) : exp_value = 
  ExpVal(i)
let bool_val (b:bool) : exp_value = 
  ExpB(b)
let proc_val (p:procedure) : exp_value = 
  Proc(p)
  
  
let is_proc (value:exp_value) : bool = 
  match value with
  | Proc(_) -> true
  | _ -> false;;

let rec value_of (exp:expression) (environment:env) : exp_value = 
  match exp with
  | Const_exp(constant_n) -> num_val(constant_n)
  | Var_exp(variable) -> num_val(apply_env(environment, variable))
  | Diff_exp(exp1,exp2) -> let val1 = value_of(exp1, environment) in
      let val2 = value_of(exp2, environment) in 
      num_val(val1 - val2)
  | Zero_exp(exp) -> let value = value_of(exp) in
      if value = 0 then bool_val(true) else bool_val(false)
  | If_exp(exp1,exp2,exp3) -> let value = value_of(exp1, environment) in 
      match value with
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
      

    
let procedure (v:var) (body:expression) (environment:env) : procedure = 
  Proc(v,body,environment)

let apply_procedure (p:procedure) (value:exp_value) : exp_value = 
  match p with
  | Proc(v,body,saved_env) -> value_of(body, extend_env(v, value, saved_env))



(* can we get rid of these functions and just rely on Ocaml to know exp_value can be int or bool *)
let expval_to_num (value:exp_value) : int = 
  match value with
  | ExpVal(i) -> i
  | _ -> error
let expval_to_bool (value:exp_value) : bool = 
  | ExpB(b) -> b
  | _ -> error
let expval_to_proc (value:exp_value) : proc = 
  if is_proc then value else error
(* Interpreter for PROC language *)

let run (s:string) : value = 
  s |> scan_and_parse |> value_of_program

let value_of_program (p:program) : value = 
  match p with
  | Expression(exp) -> let init_env = empty_env in
      value_of(exp, init_env)


