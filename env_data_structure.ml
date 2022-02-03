(* should int be a more general type*)
(* One *)
type env = E1 of empty_env | E2 of extend_env 
type var = Sym of string

type empty_env = []

type extend_env = Empty of empty_env | [V of var * I of int :: Ex of extend_env]

(* -------------------------------------------------------------------------------- *)
(* Two *)
type env = [] | [V of var * I of int:: E of env]
type var = Sym of string

let empty_env (e:env) : env = []

let extend_env (v:var) (i:int) (e:env) : env = [v,i::e]

let rec apply_env (e:env) (search_var:var) : int = 
	match e with
	| [] -> report_no_binding
	| h::t -> match h with
		| (search_var,i) -> i
		| (_,_) -> apply_env(t,search_var)
 
(* Three *)
(* -------------------------------------------------------------------------------- *)

type env = empty_env() | extend_env(V of var, I of int, E of env) 
type var = Sym of string

let empty_env (e:env) : env = let empty_env() = ()

let rec extend_env (v:var) (i:int) (e:env) : env = fun v i e -> extend_env(v,i,e)

let rec apply_env (e:env) (search_var:var) : int = 
	match e with
	| empty_env() -> report_no_binding
	| extend_env(search_var,i,env) -> i
	| extend_env(_,_,rest) -> apply_env(rest,search_var)