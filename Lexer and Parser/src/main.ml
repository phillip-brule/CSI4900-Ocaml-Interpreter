open LETREC

let parse (s : string) : expression =
	let lexbuf = Lexing.from_string s in
		let ast = Parser.prog Lexer.read lexbuf in
			ast

let eval (e: expression) : int = 
	let p = Expression(e) in 
		value_of_program p

 (* [interp s] , interprets s by lexing, parsing, evaluating and
 converting the result to a string *)
let interp (s:string) : string = 
	s |> parse |> eval |> string_of_int