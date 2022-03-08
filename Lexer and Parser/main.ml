open PROC_Implementation

let parse (s:string) : program =
	let lexbuf = Lexing.from_string s in
	let ast = Parser.prog Lexer.read lexbuf in
	ast



let interp (s:string) : string = 
	failwith "notready"