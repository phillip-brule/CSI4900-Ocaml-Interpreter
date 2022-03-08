{
	open Parser
}

let digit = ['0'-'9']
let int = '-'? digit+

rule read = 
	parse
	| int { Const_exp (int_of_string (Lexing.lexeme lexbuf)) }
	| eof { EOF }