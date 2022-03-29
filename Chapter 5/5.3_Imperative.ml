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

type procedure = {
  var : var;
  body : expression;
  saved_env : env;
}

and env = Empty_env | Extend_env of var * exp_value * env

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
                 
(*type state = 
  | Cont of continuation
  | Envn of env
  | Exp of expression
  | Value of exp_value
  | Proc1 of procedure*)
      
type state = 
  | Cont 
  | Envn 
  | Exp 
  | Value 
  | Proc1 

let empty_env () : env = Empty_env



(* type state = {
  cont : continuation ref;
  exp : expression ref;
  envn : env ref;
  value : exp_value ref;
  proc1 : procedure ref};; *)
  
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

(* let state (c:continuation) (ex:expression) (environment:env) (v:exp_value) (p:procedure): state =
  {cont = ref c ;
   exp = ref ex;
   envn = ref environment;
   value = ref v;
   proc1= ref p;} 
*)
let cont = ref Cont
let exp = ref Exp
let envn = ref Envn
let value = ref Value
let proc1 = ref Proc1

let rec apply_cont () : final_answer =
  match !state.cont with 
  | End_cont -> (Printf.printf "End of computation." ) ; FinalVal value
  | Zero1_cont(saved_cont) -> 
      (state.cont) := saved_cont;
      (state.value) := bool_val(if expval_to_num !(state.value) = 0 then true else false);
      apply_cont
  | Let_exp_cont(var, body, saved_env, saved_cont) -> 
      (state.cont) := saved_cont;
      (state.exp) := body;
      (state.envn) := extend_env var !(state.value) saved_env;
      value_of_k
  | If_test_cont(exp2, exp3, saved_env, saved_cont) -> 
      (state.cont) := saved_cont; 
      if expval_to_bool !(state.value) then 
        (state.exp) := exp2 else (state.exp):= exp3 ;
      (state.envn) := saved_env; 
      value_of_k
  | Diff1_cont(exp2, saved_env, saved_cont) -> 
      (state.cont) := Diff2_cont (!(saved.value) saved_cont);
      (state.exp) := exp2;
      (state.envn) := saved_env; 
      value_of_k 
  | Diff2_cont(val1, saved_cont) -> 
      let num1 = expval_to_num val1 in
      let num2 = expval_to_num !(state.value) in 
      (state.cont) := saved_cont;
      (state.value) := num_val(num1-num2);
      apply_cont
  | Rator_cont(rand, saved_env, saved_cont) -> 
      (state.cont):= Rand_cont (!(state.value) saved_cont);
      (state.exp) := rand;
      (state.envn) := saved_env; 
      value_of_k
  | Rand_cont(rator_val, saved_cont) -> let rator_proc = expval_to_proc rator_val in
      (state.cont) := saved_cont;
      (state.proc1) := rator_proc;
      (state.value) := !(state.value);
      apply_procedure_k 

  

let value_of_program (p:program) : final_answer = 
  match p with
  | Expression(exp1) -> let init_env = empty_env() in
      let end_c = End_cont in 
      (state.cont) := end_c; 
      (state.exp) :=  exp1;
      (state.envn):= init_env;
      value_of_k
  
    
let apply_procedure_k () : final_answer =
  match !(state.proc1) with
  | procedure(var, body, saved_env) -> 
      (state.exp) := body;
      (state.envn) := extend_env var !(state.value) saved_env;
      value_of_k


let rec value_of_k () : final_answer = 
  match !(state.exp) with
  | Const_exp(num) -> (state.value) := num_val num ; apply_cont
  | Var_exp(var) -> (state.value) := apply_env !(state.env) var; apply_cont
  | Proc_exp(var, body) -> (state.value) := proc_val (procedure var body !(state.env))
  | Zero_exp(exp) -> (state.cont) := Zero1_cont cont ; (state.exp) := exp ; value_of_k
  | Let_exp(var, exp, body) -> 
      (state.cont) := Let_exp_cont var body !(state.env) !(state.cont) ; 
      (state.exp) := exp
  | If_exp(exp1, exp2, exp3) -> 
      (state.cont) := Let_test_cont exp2 exp3 !(state.env) !(state.cont); 
      (state.exp) := exp1 ; value_of_k
  | Diff_exp(exp1, exp2) ->
      (state.cont) := Diff1_cont exp2 !(state.env) !(state.cont) ;
      (state.exp) := exp1 ; value_of_k
  | Call_exp(rator, rand) ->
      (state.cont) := Rator_cont rand !(state.env) !(state.cont) ;
      (state.exp) := rator; value_of_k
      
  

let example_run () = 
  let p = Expression(Let_exp("x", Const_exp(200), 
                             Let_exp("f", 
                                     Proc_exp("z", Diff_exp(Var_exp("z"), Var_exp("x"))),
                                     Let_exp("x", Const_exp(100), 
                                             Let_exp("g", Proc_exp("z", Diff_exp(Var_exp("z"), Var_exp("x"))),
                                                     Diff_exp(Call_exp(Var_exp("f"),Const_exp(1)),
                                                              Call_exp(Var_exp("g"),Const_exp(1)))))))) in
  print_int(value_of_program(p))

let () = example_run()