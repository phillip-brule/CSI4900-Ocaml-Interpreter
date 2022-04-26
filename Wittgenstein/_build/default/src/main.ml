open Wittgenstein

let string_of_meaning (m: meaning) : string =
	match m with
	| Sensation(i) -> string_of_int i 
	| ExpBool(b) -> Bool.to_string b 
	| Proc(_) -> "Some function"
	| NoMeaning -> "No Meaning"

let rec string_of_env (s:string) (environment:env) : string =
	match environment with
	| Empty_env -> s
	| Extend_env(word, m, nextEnv) -> string_of_env (s ^ word ^ " -> " ^ (string_of_meaning m) ^ "\n") nextEnv

let parse (s : string) : world =
	let lexbuf = Lexing.from_string s in
		let ast = Parser.prog Lexer.read lexbuf in
			ast


let string_from_output (priv_env:env) (pub_env:env) : string = 
	"Words -> Meanings\n" ^ (string_of_env "The Private Language:\n" priv_env) 
	^ "\n" ^ (string_of_env "Public Language History:\n" pub_env)

let eval (w: world) : string = 
	let res = value_of_world w in 
	match res with
	| (priv_env, pub_env) -> string_from_output priv_env pub_env

 (* [interp s] , interprets s by lexing, parsing, evaluating and
 converting the result to a string *)
let interp (s:string) : string = 
	s |> parse |> eval
(* 
world:
	| PUBLIC; pub_lang = language; PRIVATE; priv_lang = language; WORLD; 
		sensations = separated_list(SEMICOLON, INT); SPEAK; words = separated_list(SEMICOLON, ID) { World(pub_lang, priv_lang, (Empty_exp), sensations, words) } *)