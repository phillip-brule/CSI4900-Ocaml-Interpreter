
type var = string
type value = int 
type tvar = int

exception Invalid
  
type expType = 
  | Int_type  
  | Bool_type 
  | Proc_type of expType*expType

type expression = 
  | Zero_exp of expression
  | Const_exp of int
  | Diff_exp of expression * expression
  | Var_exp of var
  | If_exp of expression * expression * expression
  | Let_exp of var * expression * expression
  | Proc_exp of var * expType * expression
  | Call_exp of expression * expression

type procedure = {
  var : var;
  body : expression;
  saved_env : env;
} 

and env = Empty_env | Extend_env of var * exp_value * env

and exp_value = ExpVal of int | ExpBool of bool | Proc of procedure 
                   
type program = Expression of expression  


type tenv = Empty_tenv | Extend_tenv of var * expType * tenv
                                        
                                        
                                                 
let empty_env () : env = Empty_env

let extend_env (v:var) (value:exp_value) (e:env) : env = 
  Extend_env(v, value, e)

let rec apply_env(e:env) (search_v:var) : exp_value = 
  match e with
  | Empty_env -> raise Invalid
  | Extend_env(variable, value, envNext) -> if variable = search_v then value 
      else apply_env envNext search_v 
 
let empty_tenv () : tenv = Empty_tenv         
let extend_tenv (v:var) (value:expType) (e:tenv) : tenv = 
  Extend_tenv(v, value, e)

let rec apply_tenv(e:tenv) (search_v:var) : expType = 
  match e with
  | Empty_tenv -> raise Invalid
  | Extend_tenv(variable, value, envNext) -> if variable = search_v then value 
      else apply_tenv envNext search_v 
          
let rec type_to_external_form (ty: expType): expType list =
  match ty with
  |Int_type -> [Int_type]
  |Bool_type -> [Bool_type]
  |Proc_type(arg, res) -> type_to_external_form arg ; type_to_external_form res
  
let rec expType_to_str (v: expType): string = 
  match v with
  |Int_type -> "int"
  |Bool_type -> "bool"
  |Proc_type(res,arg) -> expType_to_str res^" -> "^ expType_to_str arg 
          
let report_unequal_types (ty1: expType) (ty2: expType) (exp: expression) = 
  "Types dont equal";(type_to_external_form ty1);(type_to_external_form ty2)
  
let check_equal_type (ty1: expType) (ty2: expType) (exp: expression) : expType list = 
  if (ty1 == ty2) then [ty1] else (report_unequal_types ty1 ty2 exp);;
     
let rec type_of(exp: expression) (tenv: tenv): expType = 
  match exp with
  |Const_exp(num) -> Int_type 
  |Var_exp(var) -> (apply_tenv tenv var)
  |Diff_exp(exp1,exp2) -> 
      let ty1 = (type_of exp1 tenv) in
      let ty2 = (type_of exp2 tenv) in
      (check_equal_type ty1 Int_type exp1);
      (check_equal_type ty2 Int_type exp2);
      Int_type
  |Zero_exp(exp1) -> let ty1 = (type_of exp1 tenv) in
      (check_equal_type ty1 Int_type exp1); Bool_type 
  |If_exp(exp1,exp2,exp3) -> 
      let ty1 = (type_of exp1 tenv) in
      let ty2 = (type_of exp2 tenv) in
      let ty3 = (type_of exp3 tenv) in
      (check_equal_type ty1 Bool_type exp1); (check_equal_type ty2 ty3 exp); ty2
  |Let_exp(var,exp1,body) ->
      let exp1_type = (type_of exp1 tenv) in
      (type_of body (extend_tenv var exp1_type tenv))
  |Proc_exp(var,var_type,body)-> 
      let result_type = (type_of body (extend_tenv var var_type tenv)) in
      Proc_type (var_type, result_type)
  |Call_exp(exp1,exp2)->
      let exp1_type = (type_of exp1 tenv) in
      let exp2_type = (type_of exp2 tenv) in
      match exp1_type with
      |_ -> exp1_type
      |Proc_type(arg,res)-> (check_equal_type arg exp2_type exp2); res

let type_of_program (p:program) : string = 
  match p with
  | Expression(exp) -> let init_env = empty_tenv() in 
      expType_to_str (type_of exp init_env)


let example_run () = 
  let p = Expression(
      Let_exp("x", Const_exp(200), 
              Let_exp("f", Proc_exp("z", Int_type, Diff_exp(Var_exp("z"), Var_exp("x"))), 
                      Let_exp("x", Const_exp(100), 
                              Let_exp("g", Proc_exp("z", Int_type, Diff_exp(Var_exp("z"), Var_exp("x"))),
                                      Diff_exp(Call_exp(Var_exp("f"),Const_exp(1)), Call_exp(Var_exp("g"),Const_exp(1))))))))in
  print_string(type_of_program p)
    
let example_run2() = 
  let p = Expression(Proc_exp("z", Int_type, Proc_exp("x", Int_type, Zero_exp(Diff_exp(Const_exp(200), Const_exp(100)))))) in
  
  print_string(type_of_program p)
    
let example_run3() = 
  let p = Expression(
      Let_exp("x", Const_exp(200), 
              Let_exp("f", Proc_exp("z", Int_type, Diff_exp(Var_exp("z"), Var_exp("x"))), 
                      Let_exp("x", Const_exp(100), 
                              Let_exp("g", Proc_exp("z", Int_type, Diff_exp(Var_exp("z"), Var_exp("x"))),
                                      Let_exp("a", Diff_exp(Call_exp(Var_exp("f"),Var_exp("b")), Call_exp(Var_exp("g"),Const_exp(1))),
                                              Zero_exp(Var_exp("a"))))))))  in
  print_string(type_of_program p)
    
let () = example_run()
let () = example_run2()
let () = example_run3()


                                              