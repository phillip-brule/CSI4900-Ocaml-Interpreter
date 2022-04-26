(* Specification of Values *)
exception Invalid

type word = string 



(* Abstract Syntax Tree *)
type expression = 
  | Zero_exp of expression
  | Const_exp of int
  | Diff_exp of expression * expression
  | Word_exp of word
  | If_exp of expression * expression * expression
  | Let_exp of word * expression * expression
  | Proc_exp of word * expression
  | Call_exp of expression * expression  (* operator operand *)
  | Empty_exp

type procedure = {
	word : word;
	body : expression;
	saved_env : env;
}

and env = Empty_env | Extend_env of word * meaning * env

and meaning = Sensation of int | ExpBool of bool | Proc of procedure | NoMeaning

type language = Assign_exp of word * meaning * language | EndOfLang

type world = World of language * language * expression * int list * word list

let empty_env () : env = Empty_env

let extend_env (v:word) (value:meaning) (e:env) : env = 
  Extend_env(v, value, e)

let rec apply_env(e:env) (search_v:word) : meaning = 
  match e with
  | Empty_env -> raise Invalid
  | Extend_env(word_x, value, envNext) -> if word_x = search_v then value 
		else apply_env envNext search_v

    
let num_val (i:int) : meaning = 
  Sensation(i)
let bool_val (b:bool) : meaning = 
  ExpBool(b)
let proc_val (p:procedure) : meaning = 
  Proc(p)

let sensation_to_num (value:meaning) : int = 
  match value with
  | Sensation(i) -> i
  | _ -> raise Invalid
let sensation_to_bool (value:meaning) : bool = 
	match value with
  | ExpBool(b) -> b
  | _ -> raise Invalid
let sensation_to_proc (value:meaning) : procedure = 
  match value with
  | Proc(p) -> p
  | _ -> raise Invalid

let procedure (v:word) (body:expression) (environment:env) : procedure = 
  {word = v;
  body = body;
  saved_env = environment;}

 let extract_meaning (x:meaning * env) : meaning =
 	match x with
 	| (m,_) -> m

let rec value_of (exp:expression) (environment:env): meaning * env = 
	match exp with
	| Const_exp(constant_n) -> ((num_val constant_n) , environment)
	| Word_exp(word_x) -> ((apply_env environment word_x), environment)
	| Diff_exp(exp1,exp2) -> let val1 = sensation_to_num (extract_meaning (value_of exp1 environment)) in 
		let val2 = sensation_to_num (extract_meaning (value_of exp2 environment)) in 
		((num_val (val1 - val2)) , environment)
	| Zero_exp(exp1) -> let value = sensation_to_num (extract_meaning (value_of exp1 environment)) in
		if value = 0 then ((bool_val true), environment) else ((bool_val false), environment)
	| If_exp(exp1,exp2,exp3) -> let value = extract_meaning (value_of exp1 environment) in 
		begin match value with 
		| ExpBool(true) -> value_of exp2 environment
		| ExpBool(false) -> value_of exp3 environment
		| _ -> raise Invalid
	end
	| Let_exp(word_x, exp1, body) -> let newEnv = extend_env word_x (extract_meaning (value_of exp1 environment)) environment in
		value_of body newEnv
(* creates procedure in context of current environment *)
	| Proc_exp(word, body) -> ((proc_val (procedure word body environment), environment))
	(* type check to make sure a proc is the operator but said proc has to be evaluted first *)
	| Call_exp(operator, operand) -> let proc = sensation_to_proc (extract_meaning (value_of operator environment)) in 
		let arg = extract_meaning (value_of operand environment) in 
		let apply_procedure (p:procedure) (value:meaning) : meaning = 
  			extract_meaning (value_of p.body (extend_env p.word value p.saved_env)) in
					((apply_procedure proc arg), (extend_env proc.word arg proc.saved_env))
	| Empty_exp -> (NoMeaning, environment)

let rec env_of_lang (lang:language) (environment:env) : env = 
	match lang with
	| Assign_exp(word_x, value, nextLang) -> env_of_lang nextLang (extend_env word_x value environment)
	| EndOfLang -> environment

let rec add_words (words:word list) (environment:env) : env =
	match words with
	| [] -> environment
	| head :: tail -> try
		extend_env head (apply_env environment head) (add_words tail environment)
		with
		| _ -> extend_env head (NoMeaning) (add_words tail environment)

let rec send_sensations (sensations: int list) (environment:env) : env =
	match sensations with 
	| [] -> environment
	| head :: tail -> let new_word = 
		(let random_int = Random.self_init (); Random.int 5 in 
			match random_int with
			| 0 -> "SensationA"
			| 1 -> "SensationB"
			| 2 -> "SensationC"
			| 3 -> "SensationD"
			| 4 -> "SensationE"
			| _ -> "SomeSensation"
		) in extend_env new_word (Sensation(head)) (send_sensations tail environment)

let evaluate_lang (priv_lang: language) (exp: expression) (environment:env) : meaning * env =
	value_of exp (env_of_lang priv_lang environment)

let value_of_world (w:world) : env * env = 
  match w with
  | World(pub_lang, priv_lang, inner_operations, sensations, words) -> let init_env = env_of_lang pub_lang (empty_env ()) in
  	let res = evaluate_lang priv_lang inner_operations init_env in
  		match res with
  		| (_, priv_env) -> let res_env = send_sensations sensations priv_env in 
  			(res_env, (add_words (List.rev words) init_env))


(* let () = example_run() *)