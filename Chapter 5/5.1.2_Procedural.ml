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
                
type procedure = {
  var : var;
  body : expression;
  saved_env : env;
}

and env = Empty_env | Extend_env of var * exp_value * env

and exp_value = ExpVal of int | ExpBool of bool | Proc of procedure
                                                        
type program = Expression of expression 

type final_answer = ExpVal of exp_value

type cont = exp_value -> final_answer


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

        
let rec apply_cont (c: cont) (exp: exp_value) : final_answer =
  c exp
    
let end_cont () : cont = 
  fun(val1: exp_value) -> (Printf.printf "End of computation." ) ; ExpVal(val1)
      
let zero1_cont (c:cont) : cont =
  fun(val1: exp_value) -> (apply_cont c (bool_val ( if expval_to_num val1 = 0 then true else false)))

      
let rec value_of_k (exp:expression) (environment:env ) (c:cont) : final_answer =
  match exp with
  | Const_exp(num) -> (apply_cont c (num_val num))
  | Var_exp(var) -> (apply_cont c (apply_env environment var))
  | Proc_exp(var, body) -> (apply_cont c (proc_val (procedure var body environment)))
                           
  | Zero_exp(exp1)-> (value_of_k exp1 environment (zero1_cont c))
  | Let_exp(var, exp1, body)-> (value_of_k exp1 environment (
      let let_exp_cont (v:var) (body:expression) (environment: env) (c:cont): cont =
        fun(val1: exp_value) -> (value_of_k body (extend_env v val1 environment) c) in
      let_exp_cont var body environment c))
  | If_exp(exp1, exp2, exp3)-> (value_of_k exp1 environment (
      let if_test_cont (exp1:expression) (exp2:expression) (environment:env) (c:cont) : cont =
        fun(val1: exp_value) -> if expval_to_bool val1 then value_of_k exp2 environment c else value_of_k exp3 environment c in
      if_test_cont exp2 exp3 environment c ))
    
                            
let value_of_program (p:program) : final_answer = 
  match p with
  | Expression(exp) -> let init_env = empty_env() in
      let end_c = end_cont() in 
      value_of_k exp init_env end_c


let  apply_procedure_k (p:procedure) (value:exp_value) (c:cont) : final_answer =
  value_of_k p.body (extend_env p.var value  p.saved_env ) c 

    
let example_run () = 
  let p = Expression(Let_exp("x", Const_exp(200), Let_exp("f", 
                                                          Proc_exp("z", Diff_exp(Var_exp("z"), Var_exp("x"))),
                                                          Let_exp("x", Const_exp(100), 
                                                                  Let_exp("g", Proc_exp("z", Diff_exp(Var_exp("z"), Var_exp("x"))),
                                                                          Diff_exp(Call_exp(Var_exp("f"),Const_exp(1)),
                                                                                   Call_exp(Var_exp("g"),Const_exp(1)))))))) in
  print_int(value_of_program(p))

let () = example_run()