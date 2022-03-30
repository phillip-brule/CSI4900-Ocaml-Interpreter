{
	open Parser
	exception Eof
}

let white = [' ' '\t']+
let digit = ['0'-'9']
let int = '-'? digit+
let letter = ['a'-'z' 'A'-'Z']
let id = letter+

rule read = 
	parse
	| white { read lexbuf }
	| ";" { SEMICOLON }
	| "=" { EQUALS }
	| "in" { IN }
	| "letrec" { LETREC }
	| "let" { LET }
	| "begin" { BEGIN }
	| "end" { END }
	| "if" { IF }
	| "then" { THEN }
	| "else" { ELSE }
	| "zero?" { ZERO }
	| "-" { DIFF }
	| "(" { LPAREN }
	| ")" { RPAREN }
	| "proc" { PROC }
	| int { INT (int_of_string (Lexing.lexeme lexbuf)) }
	| id { ID (Lexing.lexeme lexbuf) }
	| eof { EOF }