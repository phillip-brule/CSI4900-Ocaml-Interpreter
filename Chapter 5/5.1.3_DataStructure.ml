(* This is an OCaml editor.
   Enter your program here and send it to the toplevel using the "Eval code"
   button or [Ctrl-e]. *)

(* Specification of Values *)
exception Invalid

type var = string 


type expression = 
  | Zero_exp of expression
  | Const_exp of int
  | Var_exp of var
  | If_exp of expression * expression * expression
  | Let_exp of var * expression * expression
  | Proc_exp of var * expression
  | Diff_exp of expression * expression
  | Call_exp of expression * expression  (* operator operand *)
  | Letrec_exp of var * var * expression * expression (*proc-name bound-variable proc-body letrec-body*)
  | Begin_exp of expression list
                
type procedure = {
  var : var;
  body : expression;
  saved_env : env;
}

and env = Empty_env | Extend_env of var * exp_value * env| Extend_env_rec of var * var * expression * env 

and exp_value = ExpVal of int | ExpBool of bool | Proc of procedure
                                                        
type program = Expression of expression 

type final_answer = FinalVal of exp_value

type continuation =
  | End_cont 
  | Zero1_cont of continuation 
  | Let_exp_cont of var*expression*env*continuation
  | If_test_cont of expression*expression*env*continuation
  | Diff1_cont of expression*env*continuation
  | Diff2_cont of exp_value*continuation
  | Rator_cont of expression*env*continuation
  | Rand_cont of exp_value*continuation

let empty_env () : env = Empty_env

let extend_env (v:var) (value:exp_value) (e:env) : env = 
  Extend_env(v, value, e)
    
let extend_env_rec (proc_name:var) (bound_var:var) (proc_body:expression) (e:env) : env = 
  Extend_env_rec(proc_name, bound_var, proc_body, e)

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
let expval_to_finalanswer (value:exp_value): final_answer =
  FinalVal(value)  
          
let final_to_num (f:final_answer) : int =
  match f with
  | FinalVal(x) -> expval_to_num x
  | _ ->  raise Invalid
  
let procedure (v:var) (body:expression) (environment:env) : procedure = 
  {var = v;
   body = body;
   saved_env = environment;}
  

let rec apply_cont (c: continuation) (v: exp_value) : final_answer =
  match c with 
  | End_cont -> (Printf.printf "End of computation." ) ; FinalVal v
  | Zero1_cont(saved_cont) -> apply_cont saved_cont (bool_val(if expval_to_num v = 0 then true else false))
  | Let_exp_cont(var, body,saved_env, saved_cont) -> 
      value_of_k body (extend_env var v saved_env) saved_cont
  | If_test_cont(exp2, exp3, saved_env, saved_cont) -> if expval_to_bool v then 
        value_of_k exp2 saved_env saved_cont else value_of_k exp3 saved_env saved_cont 
  | Diff1_cont(exp2, saved_env, saved_cont) -> value_of_k exp2 saved_env (Diff2_cont (v, saved_cont))
  | Diff2_cont(value, saved_cont) -> let num1 = expval_to_num value in
      let num2 = expval_to_num v in apply_cont saved_cont (num_val(num1 - num2))
  | Rator_cont(rand, saved_env, saved_cont) -> value_of_k rand saved_env (Rand_cont(v, saved_cont)) 
  | Rand_cont(value, saved_cont) -> let proc1 = expval_to_proc value in
      apply_procedure_k proc1 v saved_cont
      
and value_of_k (exp:expression) (environment:env ) (c:continuation) : final_answer =
  match exp with
  | Const_exp(num) -> apply_cont c (num_val num)
  | Var_exp(var) -> apply_cont c (apply_env environment var)
  | Proc_exp(var, body) -> apply_cont c (proc_val (procedure var body environment))
  | Letrec_exp(proc_name, bound_var, proc_body, letrec_body) -> value_of_k letrec_body (extend_env_rec proc_name bound_var proc_body environment) c  
  | Zero_exp(exp1)-> value_of_k exp1 environment (Zero1_cont c)
  | Let_exp(var, exp1, body)-> value_of_k exp1 environment (Let_exp_cont(var,body,environment,c))
  | If_exp(exp1, exp2, exp3)-> value_of_k exp1 environment (If_test_cont(exp2,exp3,environment,c))
  | Diff_exp(exp1, exp2) -> value_of_k exp1 environment (Diff1_cont(exp2, environment, c))
  | Call_exp(rator, rand) -> value_of_k rator environment (Rator_cont(rand, environment, c))
                               
and apply_procedure_k (p:procedure) (value:exp_value) (c:continuation) : final_answer =
  value_of_k p.body (extend_env p.var value  p.saved_env ) c 

    
let value_of_program (p:program) : final_answer = 
  match p with
  | Expression(exp) -> let init_env = empty_env() in
      let end_c = End_cont in 
      value_of_k exp init_env end_c

    
let example_run () = 
  let p = Expression(Let_exp("x", Const_exp(200), 
                             Let_exp("f", Proc_exp("z", Diff_exp(Var_exp("z"), Var_exp("x"))),
                                     Let_exp("x", Const_exp(100), 
                                             Let_exp("g", Proc_exp("z", Diff_exp(Var_exp("z"), Var_exp("x"))),
                                                     Diff_exp(Call_exp(Var_exp("f"),Const_exp(1)),
                                                              Call_exp(Var_exp("g"),Const_exp(1)))))))) in
  print_int (final_to_num(value_of_program (p)))

let () = example_run()

    
  
    