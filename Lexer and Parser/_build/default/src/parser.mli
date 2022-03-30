
(* The type of tokens. *)

type token = 
  | ZERO
  | THEN
  | SEMICOLON
  | RPAREN
  | PROC
  | LPAREN
  | LETREC
  | LET
  | INT of (int)
  | IN
  | IF
  | ID of (string)
  | EQUALS
  | EOF
  | END
  | ELSE
  | DIFF
  | BEGIN

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (LETREC.expression)
