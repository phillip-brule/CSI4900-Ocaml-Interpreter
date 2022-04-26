
(* The type of tokens. *)

type token = 
  | ZERO
  | WORD
  | THEN
  | SPEAK
  | SEMICOLON
  | RPAREN
  | PUBLIC
  | PROC
  | PRIVATE
  | OUTSIDE
  | MEANING
  | LPAREN
  | LET
  | INT of (int)
  | IN
  | IF
  | ID of (string)
  | EQUALS
  | EOF
  | ENDLANG
  | END
  | EMPTY
  | ELSE
  | DIFF

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Wittgenstein.world)
