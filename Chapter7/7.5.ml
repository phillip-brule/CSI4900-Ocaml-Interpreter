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