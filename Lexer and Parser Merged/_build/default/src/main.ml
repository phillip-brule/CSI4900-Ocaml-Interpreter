open ProgramTypes

let parse (s : string) : programChain =
	let lexbuf = Lexing.from_string s in
		let ast = Parser.prog Lexer.read lexbuf in
			ast

let eval_program (p:program) : int = 
	match p with 
	| Letrec(x) -> LETREC.value_of_program (LETREC.Expression(x))
	| Implicit(x) -> Implicit_refs.value_of_program (Implicit_refs.Expression(x))
	| Imperative(x) -> Imperative.final_to_num (Imperative.value_of_program (Imperative.Expression(x)))

let rec eval (i: int list) (pChain: programChain): int list = 
	match pChain with
	| EmptyProgram -> i
	| ProgramChain(p, rest) -> eval ((eval_program p):: i) rest

let rec final_val (i: int list) : string = 
	match i with
	| head :: tail -> "Your result is: " ^ (string_of_int head) ^ " " ^ final_val tail
	| [] -> "."

 (* [interp s] , interprets s by lexing, parsing, evaluating and
 converting the result to a string *)
let interp (s:string) : string = 
	s |> parse |> eval [] |> final_val