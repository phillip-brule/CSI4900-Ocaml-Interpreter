type var = string
type value = int 
type tvar = int
type subvar = int

exception Invalid
  
type expType = 
  | Int_type  
  | Bool_type 
  | Tvar_type of tvar
  | Proc_type of expType*expType 
                 
type optionType = No_type | A_type of expType 
      
type expression = 
  | Zero_exp of expression
  | Const_exp of int
  | Diff_exp of expression * expression
  | Var_exp of var
  | If_exp of expression * expression * expression
  | Let_exp of var * expression * expression
  | Proc_exp of var * optionType * expression
  | Call_exp of expression * expression

type program = A_program of expression

type tenv = Empty_tenv | Extend_tenv of var * expType * tenv
                  
type substitution = (expType * expType) list 
      
type answer = An_answer of expType * substitution
  
let empty_tenv () : tenv = Empty_tenv         
let extend_tenv (v:var) (value:expType) (e:tenv) : tenv = 
  Extend_tenv(v, value, e)

let rec apply_tenv(e:tenv) (search_v:var) : expType = 
  match e with
  | Empty_tenv -> raise Invalid
  | Extend_tenv(variable, value, envNext) -> if variable = search_v then value 
      else apply_tenv envNext search_v 
  
let empty_subst () : substitution = []

let procType_check (typ: expType) :bool = 
  match typ with
  |Proc_type(_, _) -> true
  |_ -> false
 
let procType_to_arg (typ: expType) : expType = 
  match typ with
  |Proc_type(arg, res) -> arg
  |_ -> raise Invalid
          
let procType_to_res (typ: expType) : expType = 
  match typ with
  |Proc_type(arg, res) -> res
  |_ -> raise Invalid
    
let tvarType_check (typ: expType) :bool = 
  match typ with
  |Tvar_type(sn) -> true
  |_ -> false
    
let rec apply_one_subst (ty0: expType)(tvar: expType)(ty1: expType) : expType =
  match ty0 with
  |Int_type -> Int_type
  |Bool_type -> Bool_type
  |Proc_type(arg, res)->
      Proc_type (apply_one_subst arg tvar ty1, apply_one_subst res tvar ty1) 
  |Tvar_type(sn) -> if (ty0 ==  tvar) then ty1 else ty0
        
let extend_subst (subst:substitution) (tvar:expType) (ty:expType) : substitution = 
  let listmap = List.map (fun p ->
      match p with
      |(oldlhs, oldrhs) -> (oldlhs, apply_one_subst oldrhs tvar ty))
      subst in (tvar,ty)::listmap 
  
let rec apply_subst_to_type (ty:expType) (subst: substitution): expType =
  match ty with
  |Int_type -> Int_type
  |Bool_type -> Bool_type
  |Proc_type (t1,t2) ->
      Proc_type (apply_subst_to_type t1 subst, apply_subst_to_type t2 subst)
  |Tvar_type (sn) ->let tmp = List.assoc ty subst in
      ty;tmp
      

               
let rec no_occurrence (tvar: expType) (ty: expType) : bool = 
  match ty with
  |Int_type -> true
  |Bool_type -> true
  |Proc_type(arg, res) -> 
      no_occurrence tvar arg &&
      no_occurrence tvar res
  |Tvar_type (sn)-> not (tvar = ty)
  
let rec expType_to_str (v: expType): string = 
  match v with
  |Int_type -> "int"
  |Bool_type -> "bool"
  |Proc_type(res,arg) -> expType_to_str res^" -> "^ expType_to_str arg 

  
let rec type_to_external_form(ty: expType) : string list = 
  match ty with
  |Int_type -> ["Int_type"]
  |Bool_type -> ["Bool_type"]
  |Proc_type(arg, res) -> type_to_external_form arg ; type_to_external_form res
  |Tvar_type(sn) -> let str_sn = string_of_int sn in 
      "ty" :: str_sn :: []  
                 
let rec otype_to_type (otype: optionType) : expType = 
  match otype with
  |No_type -> fresh_tvar_type()
  |A_type(ty)-> ty
    
and fresh_tvar_type() : expType = 
  let sn = ref 0 in 
  sn := 1 + !sn; Tvar_type(!sn)
   
let rec type_of(exp: expression)(tenv : tenv)(subst: substitution): answer = 
  match exp with
  |Const_exp(num) -> An_answer(Int_type, subst)
  |Diff_exp(exp1, exp2) -> let ans = type_of exp1 tenv subst in
      begin match ans with 
        |An_answer(ty1, subst) -> let subst1 = unifier ty1 Int_type subst exp1 in
            let ans1 = type_of exp2 tenv subst1 in
            begin match ans1 with
              |An_answer(ty2,subst2) ->let subst3 = unifier ty2 Int_type subst2 exp2 in 
                  An_answer (Int_type, subst3)
            end 
      end
  |Zero_exp(exp1) -> let ans = type_of exp1 tenv subst in
      begin match ans with
        |An_answer(ty1, subst1) -> let subst2 = unifier ty1 Int_type subst1 exp in
            An_answer (Bool_type, subst2)
      end
  |If_exp(exp1, exp2, exp3) -> let ans = type_of exp1 tenv subst in 
      begin match ans with
        |An_answer(ty1, subst) -> let subst = unifier ty1 Bool_type subst exp1 in
            let ans1 = type_of exp2 tenv subst in
            begin match ans1 with
              |An_answer(ty2, subst) -> let ans1 = type_of exp3 tenv subst in
                  begin match ans1 with
                    |An_answer(ty3, subst) -> let subst4 = unifier ty2 ty3 subst exp in
                        An_answer (ty2, subst4)
                  end
            end
      end
  |Var_exp(var) -> An_answer(apply_tenv tenv var, subst)
  |Let_exp(var, exp1, body) -> let ans = type_of exp1 tenv subst in
      begin match ans with
        |An_answer (exp1_type, subst) -> 
            type_of body (extend_tenv var exp1_type tenv) subst
      end
  |Proc_exp(var, otype, body) -> let var_type = otype_to_type otype in
      let ans = type_of body (extend_tenv var var_type tenv) subst in 
      begin match ans with
        |An_answer(body_type, subst) -> An_answer (Proc_type (var_type,body_type),subst) 
      end
  |Call_exp(rator, rand) -> let result_type = fresh_tvar_type() in 
      let ans = type_of rator tenv subst in 
      begin match ans with
        |An_answer(rator_type, subst) -> let ans1 = type_of rand tenv subst in
            begin match ans1 with
              |An_answer(rand_type, subst) -> 
                  let subst = unifier rator_type (Proc_type (rand_type, result_type)) subst exp in 
                  An_answer (result_type, subst)
            end
      end
      
and unifier (ty1: expType) (ty2: expType) (subst: substitution) (exp: expression) :substitution = 
  let ty1 = apply_subst_to_type ty1 subst in
  let ty2 = apply_subst_to_type ty2 subst in
  let cond1 = (ty1 == ty2) in
  if (cond1) then
    subst
  else
    let cond2 = no_occurrence ty1 ty2 in
    if (cond2) then
      extend_subst subst ty1 ty2
    else
      let cond3 = no_occurrence ty2 ty1 in
      if (cond3) then
        extend_subst subst ty2 ty1
      else
        let cond4 = (procType_check ty1) && (procType_check ty2) in
        if (cond4) then
          let subst = unifier (procType_to_arg ty1) (procType_to_arg ty2) subst exp in
          let subst = unifier (procType_to_res ty1) (procType_to_res ty2) subst exp in
          subst
        else
          raise Invalid
  

let type_of_program(pgm: program): expType = 
  let initTenv = empty_tenv() in
  let emptySub = empty_subst() in
  begin match pgm with
    |A_program(exp1) -> let ans = type_of exp1 initTenv emptySub in
        begin match ans with
          |An_answer(ty, subst) -> apply_subst_to_type ty subst
        end
  end
  
let example_run () = 
  let p = A_program(
      Let_exp("x", Const_exp(200), 
              Let_exp("f", Proc_exp("z", A_type(Int_type), Diff_exp(Var_exp("z"), Var_exp("x"))), 
                      Let_exp("x", Const_exp(100), 
                              Let_exp("g", Proc_exp("z", A_type(Int_type), Diff_exp(Var_exp("z"), Var_exp("x"))),
                                      Diff_exp(Call_exp(Var_exp("f"),Const_exp(1)), Call_exp(Var_exp("g"),Const_exp(1))))))))in
  print_string (expType_to_str (type_of_program p))
    
let example_run2() = 
  let p = A_program(Proc_exp("z",No_type , Proc_exp("x", A_type(Int_type), Zero_exp(Diff_exp(Const_exp(200), Const_exp(100)))))) in
  
  print_string (expType_to_str(type_of_program p))
    
    
let() = example_run()
let () = example_run2()
  
    

    
    

        


