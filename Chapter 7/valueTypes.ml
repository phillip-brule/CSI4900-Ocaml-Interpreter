
type var = string
type value = int 
type tvar = int

exception Invalid
type arg = int
type expType = Int_type | Bool_type | Tvar_type of string | Proc_type of arg * arg

type exp_value = ExpVal of int | ExpBool of bool | Proc of procedure
type env = Empty_env | Extend_env of var * exp_value * env

type tenv = Empty_tenv | Extend_tenv of var * expType * tenv
type tvarEnv = Empty_tvarEnv | Extend_tvarEnv of tvar * expType * tvarEnv
                                     
let empty_env () : env = Empty_env

let extend_env (v:var) (value:expType) (e:env) : env = 
  Extend_env(v, value, e)

let rec apply_env(e:env) (search_v:var) : expType = 
  match e with
  | Empty_env -> raise Invalid
  | Extend_env(variable, value, envNext) -> if variable = search_v then value 
      else apply_env envNext search_v
                                     
type expression = 
  | Zero_exp of expression
  | Const_exp of int
  | Diff_exp of expression * expression
  | Var_exp of var
  | If_exp of expression * expression * expression
  | Let_exp of var * expression * expression
  | Proc_exp of var * expType * expression
  | Call_exp of expression * expression

type program = Expression of expression 
  
    
let type_to_external_form (ty: expType) : expType list= 
  match ty with
  |Int_type -> int
  |Bool_type -> bool
  |Proc_type(arg,res) -> (type_to_external_form arg) :: "->" :: (type_to_external_form res) :: []

let report_unequal_types (ty1: reType) (ty2: reType) (exp: expression) = 
  ((type_to_external_form ty1),(type_to_external_form ty2))
  
let check_equal_type (ty1: reType) (ty2: reType) (exp: expression) = 
  if (ty1 <> ty2) then (report_unequal_types ty1 ty2 exp) else (ty1,ty2);;
     
let rec type_of(exp: expression) (tenv: env): expType = 
  match exp with
  |Const_exp(num) -> Int_type 
  |Var_exp(var) -> (apply_env tenv var)
  |Diff_exp(exp1,exp2) -> 
      let ty1 = (type_of exp1 tenv) in
      let ty2 = (type_of exp2 tenv) in
      (check_equal_type ty1 int_type exp1);(check_equal_type ty2 int_type exp2) 
  |Zero_exp(exp1) -> let ty1 = (type_of exp1 tenv) in
      (check_equal_type! ty1 int_type exp1) 
  |If_exp(exp1,exp2,exp3) -> 
      let ty1 = (type_of exp1 tenv) in
      let ty2 =(type_of exp2 tenv) in
      let ty3 = (type_of exp3 tenv) in
      (check_equal_type! ty1 bool_type exp1); (check_equal_type! ty2 ty3 exp)
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
      |_ -> exp1
      |Proc_type(arg,res)-> (check_equal_type arg exp2_type exp2); res

  let apply_one_subst (ty0: expType)(tvar: expType)(ty1: expType) : expType =
    match ty0 with
    |Int_type -> int
    |Bool_type -> bool
    |Proc_type(arg, res)->
        Proc_type (apply_one_subst arg tvar ty1, apply_one_subst res tvar ty1) 
    |Tvar_type(sn) -> if (ty0 ==  tvar) then ty1 else ty0
        
  let apply_subst_to_type (ty:expType) (subst: expType list): expType =
    match ty with
    |Int_type -> int
    |Bool_type -> bool
    |Proc_type (t1,t2) ->
        Proc_type (apply_subst_to_type t1 subst, apply_subst_to_type t2 subst)
    |Tvar_type (sn) ->let tmp = List.Assoc ty subst in
        match tmp with
        |hd :: tl -> if tmp then tl else ty

  let rec no_occurrence (tvar: expType) (ty: expType) : bool = 
  match ty with
  |Int_type -> true
  |Bool_type -> true
  |Proc_type(arg, res) -> 
      no_occurrence tvar arg &&
      no_occurrence tvar res
  |Tvar_type (sn)-> not (equal tvar ty)

  let type_to_external_form (ty: expType): string list =
    match ty with
    |Int_type -> ["int"]
    |Bool_type -> ["bool"]
    |Proc_type(arg, res) -> 
        type_to_external_form arg :: "->" :: type_to_external_form res :: []
    |Tvar_type (sn)-> "ty" ^ string_of_int sn :: []



                                              