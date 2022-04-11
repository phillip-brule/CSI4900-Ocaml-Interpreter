{
	open Parser
	exception Eof
}

let white = [' ' '\t' '\n' '\r']+
let digit = ['0'-'9']
let int = '-'? digit+
let letter = ['a'-'z' 'A'-'Z']
let id = letter+

rule read = 
	parse
	| white { read lexbuf }
	| "LetRec:" { LETRECINTERP }
	| "Implicit:" { IMPLICIT }
	| "Imperative:" { IMPERATIVE }
	| "set" { SET }	
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