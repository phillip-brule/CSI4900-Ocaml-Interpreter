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
	| ";" { SEMICOLON }
	| "=" { EQUALS }
	| "in" { IN }
	| "let" { LET }
	| "end" { END }
	| "if" { IF }
	| "then" { THEN }
	| "else" { ELSE }
	| "zero?" { ZERO }
	| "-" { DIFF }
	| "(" { LPAREN }
	| ")" { RPAREN }
	| "proc" { PROC }
	| "Public Language" { PUBLIC }
	| "Private Language" { PRIVATE }
	| "end language" { ENDLANG }
	| "word:" { WORD }
	| "meaning:" { MEANING }
	| "outside sensations" { OUTSIDE }
	| "speak words" { SPEAK }
	| "Empty" {EMPTY}
	| int { INT (int_of_string (Lexing.lexeme lexbuf)) }
	| id { ID (Lexing.lexeme lexbuf) }
	| eof { EOF }