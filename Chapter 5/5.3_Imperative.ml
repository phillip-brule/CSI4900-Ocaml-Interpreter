(* Specification of Values *)
exception Invalid

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
  | Letrec_exp of var * var * expression * expression (*proc-name bound-variable proc-body letrec-body*)
        

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
                     
let procedure (v:var) (body:expression) (environment:env) : procedure = 
  {var = v;
   body = body;
   saved_env = environment;}
  
let rec apply_env(e:env) (search_v:var) : exp_value = 
  match e with
  | Empty_env -> raise Invalid
  | Extend_env(variable, value, envNext) -> if variable = search_v then value 
      else apply_env envNext search_v
  | Extend_env_rec(proc_name, bound_var, proc_body, envNext) -> 
      if proc_name = search_v then proc_val (procedure bound_var proc_body e)
      else apply_env envNext search_v
  
let cont = ref End_cont
let exp = ref (Const_exp(0))
let envn = ref Empty_env
let value = ref (num_val(0))
let proc1 = ref (procedure "" (Const_exp(0)) Empty_env)

let rec apply_cont() : final_answer =
  match !cont with 
  | End_cont -> (Printf.printf "End of computation." ) ; FinalVal !value
  | Zero1_cont(saved_cont) -> 
      cont := saved_cont;
      value := bool_val(if expval_to_num !value = 0 then true else false);
      apply_cont()
  | Let_exp_cont(var, body, saved_env, saved_cont) -> 
      cont := saved_cont;
      exp := body;
      envn := extend_env var !value saved_env;
      value_of_k()
  | If_test_cont(exp2, exp3, saved_env, saved_cont) -> 
      cont := saved_cont; 
      if expval_to_bool !value then 
        exp := exp2 else exp:= exp3 ;
      envn := saved_env; 
      value_of_k()
  | Diff1_cont(exp2, saved_env, saved_cont) -> 
      cont := Diff2_cont(!value, saved_cont);
      exp := exp2;
      envn := saved_env; 
      value_of_k() 
  | Diff2_cont(val1, saved_cont) -> 
      let num1 = expval_to_num val1 in
      let num2 = expval_to_num !value in 
      cont := saved_cont;
      value := num_val(num1-num2);
      apply_cont()
  | Rator_cont(rand, saved_env, saved_cont) -> 
      cont:= Rand_cont (!value, saved_cont);
      exp := rand;
      envn := saved_env; 
      value_of_k() 
  | Rand_cont(rator_val, saved_cont) -> let rator_proc = expval_to_proc rator_val in
      cont := saved_cont;
      proc1 := rator_proc;
      value := !value;
      apply_procedure_k() 

and value_of_k () : final_answer = 
  match !exp with
  | Const_exp(num) -> 
      value := num_val num ; 
      apply_cont()
  | Var_exp(var) -> 
      value := apply_env !envn var; 
      apply_cont()
  | Proc_exp(var, body) -> 
      value := proc_val(procedure var body !envn);
      apply_cont()
  | Letrec_exp(proc_name, bound_var, proc_body, letrec_body) ->
      exp := letrec_body;
      envn := extend_env_rec proc_name bound_var proc_body !envn; 
      value_of_k()
  | Zero_exp(exp1) -> 
      cont := Zero1_cont !cont ; 
      exp := exp1 ; 
      value_of_k()
  | Let_exp(var, exp1, body) -> 
      cont := Let_exp_cont (var, body, !envn, !cont) ; 
      exp := exp1;
      value_of_k()
  | If_exp(exp1, exp2, exp3) -> 
      cont := If_test_cont(exp2, exp3, !envn, !cont); 
      exp := exp1 ; 
      value_of_k()
  | Diff_exp(exp1, exp2) ->
      cont := Diff1_cont (exp2, !envn, !cont) ;
      exp := exp1 ; 
      value_of_k()
  | Call_exp(rator, rand) ->
      cont := Rator_cont (rand, !envn, !cont) ;
      exp := rator; 
      value_of_k()
      
and apply_procedure_k () : final_answer = 
  exp := !proc1.body;
  envn := extend_env !proc1.var !value !proc1.saved_env;
  value_of_k()
      
let value_of_program (p:program) : final_answer = 
  match p with
  | Expression(exp1) -> let init_env = empty_env() in
      let end_c = End_cont in 
      cont := end_c; 
      exp :=  exp1;
      envn:= init_env;
      value_of_k()
  
  
let example_run () = 
  let p = Expression(Let_exp("x", Const_exp(200), 
                             Let_exp("f", Proc_exp("z", Diff_exp(Var_exp("z"), Var_exp("x"))),
                                     Let_exp("x", Const_exp(100), 
                                             Let_exp("g", Proc_exp("z", Diff_exp(Var_exp("z"), Var_exp("x"))),
                                                     Diff_exp(Call_exp(Var_exp("f"),Const_exp(1)),
                                                              Call_exp(Var_exp("g"),Const_exp(1)))))))) in
  print_int(final_to_num(value_of_program(p)))

let () = example_run() 

