
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | ZERO
    | THEN
    | SET
    | SEMICOLON
    | RPAREN
    | PROC
    | LPAREN
    | LETRECINTERP
    | LETREC
    | LET
    | INT of (
# 6 "src/parser.mly"
       (int)
# 25 "src/parser.ml"
  )
    | IN
    | IMPLICIT
    | IMPERATIVE
    | IF
    | ID of (
# 7 "src/parser.mly"
       (string)
# 34 "src/parser.ml"
  )
    | EQUALS
    | EOF
    | END
    | ELSE
    | DIFF
    | BEGIN
  
end

include MenhirBasics

# 1 "src/parser.mly"
  
	open ProgramTypes

# 51 "src/parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState000 : ('s, _menhir_box_prog) _menhir_state
    (** State 000.
        Stack shape : .
        Start symbol: prog. *)

  | MenhirState001 : (('s, _menhir_box_prog) _menhir_cell1_LETRECINTERP, _menhir_box_prog) _menhir_state
    (** State 001.
        Stack shape : LETRECINTERP.
        Start symbol: prog. *)

  | MenhirState002 : (('s, _menhir_box_prog) _menhir_cell1_ZERO, _menhir_box_prog) _menhir_state
    (** State 002.
        Stack shape : ZERO.
        Start symbol: prog. *)

  | MenhirState004 : (('s, _menhir_box_prog) _menhir_cell1_PROC _menhir_cell0_ID, _menhir_box_prog) _menhir_state
    (** State 004.
        Stack shape : PROC ID.
        Start symbol: prog. *)

  | MenhirState005 : (('s, _menhir_box_prog) _menhir_cell1_LPAREN, _menhir_box_prog) _menhir_state
    (** State 005.
        Stack shape : LPAREN.
        Start symbol: prog. *)

  | MenhirState011 : (('s, _menhir_box_prog) _menhir_cell1_LETREC _menhir_cell0_ID _menhir_cell0_ID, _menhir_box_prog) _menhir_state
    (** State 011.
        Stack shape : LETREC ID ID.
        Start symbol: prog. *)

  | MenhirState014 : (('s, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_ID, _menhir_box_prog) _menhir_state
    (** State 014.
        Stack shape : LET ID.
        Start symbol: prog. *)

  | MenhirState016 : (('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_state
    (** State 016.
        Stack shape : IF.
        Start symbol: prog. *)

  | MenhirState018 : (('s, _menhir_box_prog) _menhir_cell1_BEGIN, _menhir_box_prog) _menhir_state
    (** State 018.
        Stack shape : BEGIN.
        Start symbol: prog. *)

  | MenhirState022 : (('s, _menhir_box_prog) _menhir_cell1_letrec_expression, _menhir_box_prog) _menhir_state
    (** State 022.
        Stack shape : letrec_expression.
        Start symbol: prog. *)

  | MenhirState023 : ((('s, _menhir_box_prog) _menhir_cell1_letrec_expression, _menhir_box_prog) _menhir_cell1_SEMICOLON, _menhir_box_prog) _menhir_state
    (** State 023.
        Stack shape : letrec_expression SEMICOLON.
        Start symbol: prog. *)

  | MenhirState025 : ((('s, _menhir_box_prog) _menhir_cell1_letrec_expression, _menhir_box_prog) _menhir_cell1_DIFF, _menhir_box_prog) _menhir_state
    (** State 025.
        Stack shape : letrec_expression DIFF.
        Start symbol: prog. *)

  | MenhirState026 : (((('s, _menhir_box_prog) _menhir_cell1_letrec_expression, _menhir_box_prog) _menhir_cell1_DIFF, _menhir_box_prog) _menhir_cell1_letrec_expression, _menhir_box_prog) _menhir_state
    (** State 026.
        Stack shape : letrec_expression DIFF letrec_expression.
        Start symbol: prog. *)

  | MenhirState027 : ((('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_letrec_expression, _menhir_box_prog) _menhir_state
    (** State 027.
        Stack shape : IF letrec_expression.
        Start symbol: prog. *)

  | MenhirState028 : (((('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_letrec_expression, _menhir_box_prog) _menhir_cell1_THEN, _menhir_box_prog) _menhir_state
    (** State 028.
        Stack shape : IF letrec_expression THEN.
        Start symbol: prog. *)

  | MenhirState029 : ((((('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_letrec_expression, _menhir_box_prog) _menhir_cell1_THEN, _menhir_box_prog) _menhir_cell1_letrec_expression, _menhir_box_prog) _menhir_state
    (** State 029.
        Stack shape : IF letrec_expression THEN letrec_expression.
        Start symbol: prog. *)

  | MenhirState030 : (((((('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_letrec_expression, _menhir_box_prog) _menhir_cell1_THEN, _menhir_box_prog) _menhir_cell1_letrec_expression, _menhir_box_prog) _menhir_cell1_ELSE, _menhir_box_prog) _menhir_state
    (** State 030.
        Stack shape : IF letrec_expression THEN letrec_expression ELSE.
        Start symbol: prog. *)

  | MenhirState031 : ((((((('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_letrec_expression, _menhir_box_prog) _menhir_cell1_THEN, _menhir_box_prog) _menhir_cell1_letrec_expression, _menhir_box_prog) _menhir_cell1_ELSE, _menhir_box_prog) _menhir_cell1_letrec_expression, _menhir_box_prog) _menhir_state
    (** State 031.
        Stack shape : IF letrec_expression THEN letrec_expression ELSE letrec_expression.
        Start symbol: prog. *)

  | MenhirState032 : ((('s, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_ID, _menhir_box_prog) _menhir_cell1_letrec_expression, _menhir_box_prog) _menhir_state
    (** State 032.
        Stack shape : LET ID letrec_expression.
        Start symbol: prog. *)

  | MenhirState033 : (((('s, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_ID, _menhir_box_prog) _menhir_cell1_letrec_expression, _menhir_box_prog) _menhir_cell1_IN, _menhir_box_prog) _menhir_state
    (** State 033.
        Stack shape : LET ID letrec_expression IN.
        Start symbol: prog. *)

  | MenhirState034 : ((((('s, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_ID, _menhir_box_prog) _menhir_cell1_letrec_expression, _menhir_box_prog) _menhir_cell1_IN, _menhir_box_prog) _menhir_cell1_letrec_expression, _menhir_box_prog) _menhir_state
    (** State 034.
        Stack shape : LET ID letrec_expression IN letrec_expression.
        Start symbol: prog. *)

  | MenhirState035 : ((('s, _menhir_box_prog) _menhir_cell1_LETREC _menhir_cell0_ID _menhir_cell0_ID, _menhir_box_prog) _menhir_cell1_letrec_expression, _menhir_box_prog) _menhir_state
    (** State 035.
        Stack shape : LETREC ID ID letrec_expression.
        Start symbol: prog. *)

  | MenhirState036 : (((('s, _menhir_box_prog) _menhir_cell1_LETREC _menhir_cell0_ID _menhir_cell0_ID, _menhir_box_prog) _menhir_cell1_letrec_expression, _menhir_box_prog) _menhir_cell1_IN, _menhir_box_prog) _menhir_state
    (** State 036.
        Stack shape : LETREC ID ID letrec_expression IN.
        Start symbol: prog. *)

  | MenhirState037 : ((((('s, _menhir_box_prog) _menhir_cell1_LETREC _menhir_cell0_ID _menhir_cell0_ID, _menhir_box_prog) _menhir_cell1_letrec_expression, _menhir_box_prog) _menhir_cell1_IN, _menhir_box_prog) _menhir_cell1_letrec_expression, _menhir_box_prog) _menhir_state
    (** State 037.
        Stack shape : LETREC ID ID letrec_expression IN letrec_expression.
        Start symbol: prog. *)

  | MenhirState038 : ((('s, _menhir_box_prog) _menhir_cell1_LPAREN, _menhir_box_prog) _menhir_cell1_letrec_expression, _menhir_box_prog) _menhir_state
    (** State 038.
        Stack shape : LPAREN letrec_expression.
        Start symbol: prog. *)

  | MenhirState040 : (((('s, _menhir_box_prog) _menhir_cell1_LPAREN, _menhir_box_prog) _menhir_cell1_letrec_expression, _menhir_box_prog) _menhir_cell1_letrec_expression, _menhir_box_prog) _menhir_state
    (** State 040.
        Stack shape : LPAREN letrec_expression letrec_expression.
        Start symbol: prog. *)

  | MenhirState042 : ((('s, _menhir_box_prog) _menhir_cell1_PROC _menhir_cell0_ID, _menhir_box_prog) _menhir_cell1_letrec_expression, _menhir_box_prog) _menhir_state
    (** State 042.
        Stack shape : PROC ID letrec_expression.
        Start symbol: prog. *)

  | MenhirState043 : ((('s, _menhir_box_prog) _menhir_cell1_ZERO, _menhir_box_prog) _menhir_cell1_letrec_expression, _menhir_box_prog) _menhir_state
    (** State 043.
        Stack shape : ZERO letrec_expression.
        Start symbol: prog. *)

  | MenhirState044 : ((('s, _menhir_box_prog) _menhir_cell1_LETRECINTERP, _menhir_box_prog) _menhir_cell1_letrec_expression, _menhir_box_prog) _menhir_state
    (** State 044.
        Stack shape : LETRECINTERP letrec_expression.
        Start symbol: prog. *)

  | MenhirState045 : (('s, _menhir_box_prog) _menhir_cell1_IMPLICIT, _menhir_box_prog) _menhir_state
    (** State 045.
        Stack shape : IMPLICIT.
        Start symbol: prog. *)

  | MenhirState046 : (('s, _menhir_box_prog) _menhir_cell1_ZERO, _menhir_box_prog) _menhir_state
    (** State 046.
        Stack shape : ZERO.
        Start symbol: prog. *)

  | MenhirState049 : (('s, _menhir_box_prog) _menhir_cell1_SET _menhir_cell0_ID, _menhir_box_prog) _menhir_state
    (** State 049.
        Stack shape : SET ID.
        Start symbol: prog. *)

  | MenhirState051 : (('s, _menhir_box_prog) _menhir_cell1_PROC _menhir_cell0_ID, _menhir_box_prog) _menhir_state
    (** State 051.
        Stack shape : PROC ID.
        Start symbol: prog. *)

  | MenhirState052 : (('s, _menhir_box_prog) _menhir_cell1_LPAREN, _menhir_box_prog) _menhir_state
    (** State 052.
        Stack shape : LPAREN.
        Start symbol: prog. *)

  | MenhirState058 : (('s, _menhir_box_prog) _menhir_cell1_LETREC _menhir_cell0_ID _menhir_cell0_ID, _menhir_box_prog) _menhir_state
    (** State 058.
        Stack shape : LETREC ID ID.
        Start symbol: prog. *)

  | MenhirState061 : (('s, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_ID, _menhir_box_prog) _menhir_state
    (** State 061.
        Stack shape : LET ID.
        Start symbol: prog. *)

  | MenhirState063 : (('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_state
    (** State 063.
        Stack shape : IF.
        Start symbol: prog. *)

  | MenhirState065 : (('s, _menhir_box_prog) _menhir_cell1_BEGIN, _menhir_box_prog) _menhir_state
    (** State 065.
        Stack shape : BEGIN.
        Start symbol: prog. *)

  | MenhirState069 : (('s, _menhir_box_prog) _menhir_cell1_implicit_expression, _menhir_box_prog) _menhir_state
    (** State 069.
        Stack shape : implicit_expression.
        Start symbol: prog. *)

  | MenhirState070 : ((('s, _menhir_box_prog) _menhir_cell1_implicit_expression, _menhir_box_prog) _menhir_cell1_SEMICOLON, _menhir_box_prog) _menhir_state
    (** State 070.
        Stack shape : implicit_expression SEMICOLON.
        Start symbol: prog. *)

  | MenhirState072 : ((('s, _menhir_box_prog) _menhir_cell1_implicit_expression, _menhir_box_prog) _menhir_cell1_DIFF, _menhir_box_prog) _menhir_state
    (** State 072.
        Stack shape : implicit_expression DIFF.
        Start symbol: prog. *)

  | MenhirState073 : (((('s, _menhir_box_prog) _menhir_cell1_implicit_expression, _menhir_box_prog) _menhir_cell1_DIFF, _menhir_box_prog) _menhir_cell1_implicit_expression, _menhir_box_prog) _menhir_state
    (** State 073.
        Stack shape : implicit_expression DIFF implicit_expression.
        Start symbol: prog. *)

  | MenhirState074 : ((('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_implicit_expression, _menhir_box_prog) _menhir_state
    (** State 074.
        Stack shape : IF implicit_expression.
        Start symbol: prog. *)

  | MenhirState075 : (((('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_implicit_expression, _menhir_box_prog) _menhir_cell1_THEN, _menhir_box_prog) _menhir_state
    (** State 075.
        Stack shape : IF implicit_expression THEN.
        Start symbol: prog. *)

  | MenhirState076 : ((((('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_implicit_expression, _menhir_box_prog) _menhir_cell1_THEN, _menhir_box_prog) _menhir_cell1_implicit_expression, _menhir_box_prog) _menhir_state
    (** State 076.
        Stack shape : IF implicit_expression THEN implicit_expression.
        Start symbol: prog. *)

  | MenhirState077 : (((((('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_implicit_expression, _menhir_box_prog) _menhir_cell1_THEN, _menhir_box_prog) _menhir_cell1_implicit_expression, _menhir_box_prog) _menhir_cell1_ELSE, _menhir_box_prog) _menhir_state
    (** State 077.
        Stack shape : IF implicit_expression THEN implicit_expression ELSE.
        Start symbol: prog. *)

  | MenhirState078 : ((((((('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_implicit_expression, _menhir_box_prog) _menhir_cell1_THEN, _menhir_box_prog) _menhir_cell1_implicit_expression, _menhir_box_prog) _menhir_cell1_ELSE, _menhir_box_prog) _menhir_cell1_implicit_expression, _menhir_box_prog) _menhir_state
    (** State 078.
        Stack shape : IF implicit_expression THEN implicit_expression ELSE implicit_expression.
        Start symbol: prog. *)

  | MenhirState079 : ((('s, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_ID, _menhir_box_prog) _menhir_cell1_implicit_expression, _menhir_box_prog) _menhir_state
    (** State 079.
        Stack shape : LET ID implicit_expression.
        Start symbol: prog. *)

  | MenhirState080 : (((('s, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_ID, _menhir_box_prog) _menhir_cell1_implicit_expression, _menhir_box_prog) _menhir_cell1_IN, _menhir_box_prog) _menhir_state
    (** State 080.
        Stack shape : LET ID implicit_expression IN.
        Start symbol: prog. *)

  | MenhirState081 : ((((('s, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_ID, _menhir_box_prog) _menhir_cell1_implicit_expression, _menhir_box_prog) _menhir_cell1_IN, _menhir_box_prog) _menhir_cell1_implicit_expression, _menhir_box_prog) _menhir_state
    (** State 081.
        Stack shape : LET ID implicit_expression IN implicit_expression.
        Start symbol: prog. *)

  | MenhirState082 : ((('s, _menhir_box_prog) _menhir_cell1_LETREC _menhir_cell0_ID _menhir_cell0_ID, _menhir_box_prog) _menhir_cell1_implicit_expression, _menhir_box_prog) _menhir_state
    (** State 082.
        Stack shape : LETREC ID ID implicit_expression.
        Start symbol: prog. *)

  | MenhirState083 : (((('s, _menhir_box_prog) _menhir_cell1_LETREC _menhir_cell0_ID _menhir_cell0_ID, _menhir_box_prog) _menhir_cell1_implicit_expression, _menhir_box_prog) _menhir_cell1_IN, _menhir_box_prog) _menhir_state
    (** State 083.
        Stack shape : LETREC ID ID implicit_expression IN.
        Start symbol: prog. *)

  | MenhirState084 : ((((('s, _menhir_box_prog) _menhir_cell1_LETREC _menhir_cell0_ID _menhir_cell0_ID, _menhir_box_prog) _menhir_cell1_implicit_expression, _menhir_box_prog) _menhir_cell1_IN, _menhir_box_prog) _menhir_cell1_implicit_expression, _menhir_box_prog) _menhir_state
    (** State 084.
        Stack shape : LETREC ID ID implicit_expression IN implicit_expression.
        Start symbol: prog. *)

  | MenhirState085 : ((('s, _menhir_box_prog) _menhir_cell1_LPAREN, _menhir_box_prog) _menhir_cell1_implicit_expression, _menhir_box_prog) _menhir_state
    (** State 085.
        Stack shape : LPAREN implicit_expression.
        Start symbol: prog. *)

  | MenhirState087 : (((('s, _menhir_box_prog) _menhir_cell1_LPAREN, _menhir_box_prog) _menhir_cell1_implicit_expression, _menhir_box_prog) _menhir_cell1_implicit_expression, _menhir_box_prog) _menhir_state
    (** State 087.
        Stack shape : LPAREN implicit_expression implicit_expression.
        Start symbol: prog. *)

  | MenhirState089 : ((('s, _menhir_box_prog) _menhir_cell1_PROC _menhir_cell0_ID, _menhir_box_prog) _menhir_cell1_implicit_expression, _menhir_box_prog) _menhir_state
    (** State 089.
        Stack shape : PROC ID implicit_expression.
        Start symbol: prog. *)

  | MenhirState090 : ((('s, _menhir_box_prog) _menhir_cell1_SET _menhir_cell0_ID, _menhir_box_prog) _menhir_cell1_implicit_expression, _menhir_box_prog) _menhir_state
    (** State 090.
        Stack shape : SET ID implicit_expression.
        Start symbol: prog. *)

  | MenhirState091 : ((('s, _menhir_box_prog) _menhir_cell1_ZERO, _menhir_box_prog) _menhir_cell1_implicit_expression, _menhir_box_prog) _menhir_state
    (** State 091.
        Stack shape : ZERO implicit_expression.
        Start symbol: prog. *)

  | MenhirState092 : ((('s, _menhir_box_prog) _menhir_cell1_IMPLICIT, _menhir_box_prog) _menhir_cell1_implicit_expression, _menhir_box_prog) _menhir_state
    (** State 092.
        Stack shape : IMPLICIT implicit_expression.
        Start symbol: prog. *)

  | MenhirState093 : (('s, _menhir_box_prog) _menhir_cell1_IMPERATIVE, _menhir_box_prog) _menhir_state
    (** State 093.
        Stack shape : IMPERATIVE.
        Start symbol: prog. *)

  | MenhirState094 : (('s, _menhir_box_prog) _menhir_cell1_ZERO, _menhir_box_prog) _menhir_state
    (** State 094.
        Stack shape : ZERO.
        Start symbol: prog. *)

  | MenhirState096 : (('s, _menhir_box_prog) _menhir_cell1_PROC _menhir_cell0_ID, _menhir_box_prog) _menhir_state
    (** State 096.
        Stack shape : PROC ID.
        Start symbol: prog. *)

  | MenhirState097 : (('s, _menhir_box_prog) _menhir_cell1_LPAREN, _menhir_box_prog) _menhir_state
    (** State 097.
        Stack shape : LPAREN.
        Start symbol: prog. *)

  | MenhirState103 : (('s, _menhir_box_prog) _menhir_cell1_LETREC _menhir_cell0_ID _menhir_cell0_ID, _menhir_box_prog) _menhir_state
    (** State 103.
        Stack shape : LETREC ID ID.
        Start symbol: prog. *)

  | MenhirState106 : (('s, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_ID, _menhir_box_prog) _menhir_state
    (** State 106.
        Stack shape : LET ID.
        Start symbol: prog. *)

  | MenhirState108 : (('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_state
    (** State 108.
        Stack shape : IF.
        Start symbol: prog. *)

  | MenhirState110 : ((('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_imperative_expression, _menhir_box_prog) _menhir_state
    (** State 110.
        Stack shape : IF imperative_expression.
        Start symbol: prog. *)

  | MenhirState111 : (((('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_imperative_expression, _menhir_box_prog) _menhir_cell1_THEN, _menhir_box_prog) _menhir_state
    (** State 111.
        Stack shape : IF imperative_expression THEN.
        Start symbol: prog. *)

  | MenhirState112 : ((((('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_imperative_expression, _menhir_box_prog) _menhir_cell1_THEN, _menhir_box_prog) _menhir_cell1_imperative_expression, _menhir_box_prog) _menhir_state
    (** State 112.
        Stack shape : IF imperative_expression THEN imperative_expression.
        Start symbol: prog. *)

  | MenhirState113 : (((((('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_imperative_expression, _menhir_box_prog) _menhir_cell1_THEN, _menhir_box_prog) _menhir_cell1_imperative_expression, _menhir_box_prog) _menhir_cell1_ELSE, _menhir_box_prog) _menhir_state
    (** State 113.
        Stack shape : IF imperative_expression THEN imperative_expression ELSE.
        Start symbol: prog. *)

  | MenhirState114 : ((((((('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_imperative_expression, _menhir_box_prog) _menhir_cell1_THEN, _menhir_box_prog) _menhir_cell1_imperative_expression, _menhir_box_prog) _menhir_cell1_ELSE, _menhir_box_prog) _menhir_cell1_imperative_expression, _menhir_box_prog) _menhir_state
    (** State 114.
        Stack shape : IF imperative_expression THEN imperative_expression ELSE imperative_expression.
        Start symbol: prog. *)

  | MenhirState115 : ((('s, _menhir_box_prog) _menhir_cell1_imperative_expression, _menhir_box_prog) _menhir_cell1_DIFF, _menhir_box_prog) _menhir_state
    (** State 115.
        Stack shape : imperative_expression DIFF.
        Start symbol: prog. *)

  | MenhirState116 : (((('s, _menhir_box_prog) _menhir_cell1_imperative_expression, _menhir_box_prog) _menhir_cell1_DIFF, _menhir_box_prog) _menhir_cell1_imperative_expression, _menhir_box_prog) _menhir_state
    (** State 116.
        Stack shape : imperative_expression DIFF imperative_expression.
        Start symbol: prog. *)

  | MenhirState117 : ((('s, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_ID, _menhir_box_prog) _menhir_cell1_imperative_expression, _menhir_box_prog) _menhir_state
    (** State 117.
        Stack shape : LET ID imperative_expression.
        Start symbol: prog. *)

  | MenhirState118 : (((('s, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_ID, _menhir_box_prog) _menhir_cell1_imperative_expression, _menhir_box_prog) _menhir_cell1_IN, _menhir_box_prog) _menhir_state
    (** State 118.
        Stack shape : LET ID imperative_expression IN.
        Start symbol: prog. *)

  | MenhirState119 : ((((('s, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_ID, _menhir_box_prog) _menhir_cell1_imperative_expression, _menhir_box_prog) _menhir_cell1_IN, _menhir_box_prog) _menhir_cell1_imperative_expression, _menhir_box_prog) _menhir_state
    (** State 119.
        Stack shape : LET ID imperative_expression IN imperative_expression.
        Start symbol: prog. *)

  | MenhirState120 : ((('s, _menhir_box_prog) _menhir_cell1_LETREC _menhir_cell0_ID _menhir_cell0_ID, _menhir_box_prog) _menhir_cell1_imperative_expression, _menhir_box_prog) _menhir_state
    (** State 120.
        Stack shape : LETREC ID ID imperative_expression.
        Start symbol: prog. *)

  | MenhirState121 : (((('s, _menhir_box_prog) _menhir_cell1_LETREC _menhir_cell0_ID _menhir_cell0_ID, _menhir_box_prog) _menhir_cell1_imperative_expression, _menhir_box_prog) _menhir_cell1_IN, _menhir_box_prog) _menhir_state
    (** State 121.
        Stack shape : LETREC ID ID imperative_expression IN.
        Start symbol: prog. *)

  | MenhirState122 : ((((('s, _menhir_box_prog) _menhir_cell1_LETREC _menhir_cell0_ID _menhir_cell0_ID, _menhir_box_prog) _menhir_cell1_imperative_expression, _menhir_box_prog) _menhir_cell1_IN, _menhir_box_prog) _menhir_cell1_imperative_expression, _menhir_box_prog) _menhir_state
    (** State 122.
        Stack shape : LETREC ID ID imperative_expression IN imperative_expression.
        Start symbol: prog. *)

  | MenhirState123 : ((('s, _menhir_box_prog) _menhir_cell1_LPAREN, _menhir_box_prog) _menhir_cell1_imperative_expression, _menhir_box_prog) _menhir_state
    (** State 123.
        Stack shape : LPAREN imperative_expression.
        Start symbol: prog. *)

  | MenhirState125 : (((('s, _menhir_box_prog) _menhir_cell1_LPAREN, _menhir_box_prog) _menhir_cell1_imperative_expression, _menhir_box_prog) _menhir_cell1_imperative_expression, _menhir_box_prog) _menhir_state
    (** State 125.
        Stack shape : LPAREN imperative_expression imperative_expression.
        Start symbol: prog. *)

  | MenhirState127 : ((('s, _menhir_box_prog) _menhir_cell1_PROC _menhir_cell0_ID, _menhir_box_prog) _menhir_cell1_imperative_expression, _menhir_box_prog) _menhir_state
    (** State 127.
        Stack shape : PROC ID imperative_expression.
        Start symbol: prog. *)

  | MenhirState128 : ((('s, _menhir_box_prog) _menhir_cell1_ZERO, _menhir_box_prog) _menhir_cell1_imperative_expression, _menhir_box_prog) _menhir_state
    (** State 128.
        Stack shape : ZERO imperative_expression.
        Start symbol: prog. *)

  | MenhirState129 : ((('s, _menhir_box_prog) _menhir_cell1_IMPERATIVE, _menhir_box_prog) _menhir_cell1_imperative_expression, _menhir_box_prog) _menhir_state
    (** State 129.
        Stack shape : IMPERATIVE imperative_expression.
        Start symbol: prog. *)


and ('s, 'r) _menhir_cell1_imperative_expression = 
  | MenhirCell1_imperative_expression of 's * ('s, 'r) _menhir_state * (Imperative.expression)

and ('s, 'r) _menhir_cell1_implicit_expression = 
  | MenhirCell1_implicit_expression of 's * ('s, 'r) _menhir_state * (Implicit_refs.expression)

and ('s, 'r) _menhir_cell1_letrec_expression = 
  | MenhirCell1_letrec_expression of 's * ('s, 'r) _menhir_state * (LETREC.expression)

and ('s, 'r) _menhir_cell1_BEGIN = 
  | MenhirCell1_BEGIN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_DIFF = 
  | MenhirCell1_DIFF of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_ELSE = 
  | MenhirCell1_ELSE of 's * ('s, 'r) _menhir_state

and 's _menhir_cell0_ID = 
  | MenhirCell0_ID of 's * (
# 7 "src/parser.mly"
       (string)
# 497 "src/parser.ml"
)

and ('s, 'r) _menhir_cell1_IF = 
  | MenhirCell1_IF of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_IMPERATIVE = 
  | MenhirCell1_IMPERATIVE of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_IMPLICIT = 
  | MenhirCell1_IMPLICIT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_IN = 
  | MenhirCell1_IN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LET = 
  | MenhirCell1_LET of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LETREC = 
  | MenhirCell1_LETREC of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LETRECINTERP = 
  | MenhirCell1_LETRECINTERP of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LPAREN = 
  | MenhirCell1_LPAREN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_PROC = 
  | MenhirCell1_PROC of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_SEMICOLON = 
  | MenhirCell1_SEMICOLON of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_SET = 
  | MenhirCell1_SET of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_THEN = 
  | MenhirCell1_THEN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_ZERO = 
  | MenhirCell1_ZERO of 's * ('s, 'r) _menhir_state

and _menhir_box_prog = 
  | MenhirBox_prog of (ProgramTypes.programChain) [@@unboxed]

let _menhir_action_01 =
  fun i ->
    
# 74 "src/parser.mly"
            ( Imperative.Const_exp(i) )
# 547 "src/parser.ml"
    

let _menhir_action_02 =
  fun x ->
    
# 75 "src/parser.mly"
          ( Imperative.Var_exp(x) )
# 555 "src/parser.ml"
    

let _menhir_action_03 =
  fun e1 e2 ->
    
# 76 "src/parser.mly"
                                                                ( Imperative.Diff_exp(e1, e2) )
# 563 "src/parser.ml"
    

let _menhir_action_04 =
  fun e1 e2 x ->
    
# 77 "src/parser.mly"
                                                                                   ( Imperative.Let_exp(x, e1, e2))
# 571 "src/parser.ml"
    

let _menhir_action_05 =
  fun bound letrec_body proc x ->
    
# 78 "src/parser.mly"
                                                                                                                             ( Imperative.Letrec_exp(x, bound, proc, letrec_body))
# 579 "src/parser.ml"
    

let _menhir_action_06 =
  fun e ->
    
# 79 "src/parser.mly"
                                             ( e )
# 587 "src/parser.ml"
    

let _menhir_action_07 =
  fun e1 e2 ->
    
# 80 "src/parser.mly"
                                                                          ( Imperative.Call_exp(e1, e2) )
# 595 "src/parser.ml"
    

let _menhir_action_08 =
  fun e ->
    
# 81 "src/parser.mly"
                                   ( Imperative.Zero_exp(e))
# 603 "src/parser.ml"
    

let _menhir_action_09 =
  fun e1 e2 e3 ->
    
# 82 "src/parser.mly"
                                                                                                      ( Imperative.If_exp(e1, e2, e3))
# 611 "src/parser.ml"
    

let _menhir_action_10 =
  fun e x ->
    
# 83 "src/parser.mly"
                                            ( Imperative.Proc_exp(x, e) )
# 619 "src/parser.ml"
    

let _menhir_action_11 =
  fun i ->
    
# 45 "src/parser.mly"
            ( Implicit_refs.Const_exp(i) )
# 627 "src/parser.ml"
    

let _menhir_action_12 =
  fun x ->
    
# 46 "src/parser.mly"
          ( Implicit_refs.Var_exp(x) )
# 635 "src/parser.ml"
    

let _menhir_action_13 =
  fun e1 e2 ->
    
# 47 "src/parser.mly"
                                                            ( Implicit_refs.Diff_exp(e1, e2) )
# 643 "src/parser.ml"
    

let _menhir_action_14 =
  fun e x ->
    
# 48 "src/parser.mly"
                                                ( Implicit_refs.Assign_exp(x,e) )
# 651 "src/parser.ml"
    

let _menhir_action_15 =
  fun e1 e2 x ->
    
# 49 "src/parser.mly"
                                                                               ( Implicit_refs.Let_exp(x, e1, e2))
# 659 "src/parser.ml"
    

let _menhir_action_16 =
  fun bound letrec_body proc x ->
    
# 50 "src/parser.mly"
                                                                                                                         ( Implicit_refs.Letrec_exp(x, bound, proc, letrec_body))
# 667 "src/parser.ml"
    

let _menhir_action_17 =
  fun xs ->
    let exp_list = 
# 229 "<standard.mly>"
    ( xs )
# 675 "src/parser.ml"
     in
    
# 51 "src/parser.mly"
                                                                         ( Implicit_refs.Begin_exp(exp_list) )
# 680 "src/parser.ml"
    

let _menhir_action_18 =
  fun e ->
    
# 52 "src/parser.mly"
                                           ( e )
# 688 "src/parser.ml"
    

let _menhir_action_19 =
  fun e1 e2 ->
    
# 53 "src/parser.mly"
                                                                      ( Implicit_refs.Call_exp(e1, e2) )
# 696 "src/parser.ml"
    

let _menhir_action_20 =
  fun e ->
    
# 54 "src/parser.mly"
                                 ( Implicit_refs.Zero_exp(e))
# 704 "src/parser.ml"
    

let _menhir_action_21 =
  fun e1 e2 e3 ->
    
# 55 "src/parser.mly"
                                                                                                ( Implicit_refs.If_exp(e1, e2, e3))
# 712 "src/parser.ml"
    

let _menhir_action_22 =
  fun e x ->
    
# 56 "src/parser.mly"
                                          ( Implicit_refs.Proc_exp(x, e) )
# 720 "src/parser.ml"
    

let _menhir_action_23 =
  fun i ->
    
# 60 "src/parser.mly"
            ( LETREC.Const_exp(i) )
# 728 "src/parser.ml"
    

let _menhir_action_24 =
  fun x ->
    
# 61 "src/parser.mly"
          ( LETREC.Var_exp(x) )
# 736 "src/parser.ml"
    

let _menhir_action_25 =
  fun e1 e2 ->
    
# 62 "src/parser.mly"
                                                        ( LETREC.Diff_exp(e1, e2) )
# 744 "src/parser.ml"
    

let _menhir_action_26 =
  fun e1 e2 x ->
    
# 63 "src/parser.mly"
                                                                           ( LETREC.Let_exp(x, e1, e2))
# 752 "src/parser.ml"
    

let _menhir_action_27 =
  fun bound letrec_body proc x ->
    
# 64 "src/parser.mly"
                                                                                                                     ( LETREC.Letrec_exp(x, bound, proc, letrec_body))
# 760 "src/parser.ml"
    

let _menhir_action_28 =
  fun xs ->
    let exp_list = 
# 229 "<standard.mly>"
    ( xs )
# 768 "src/parser.ml"
     in
    
# 65 "src/parser.mly"
                                                                       ( LETREC.Begin_exp(exp_list) )
# 773 "src/parser.ml"
    

let _menhir_action_29 =
  fun e ->
    
# 66 "src/parser.mly"
                                         ( e )
# 781 "src/parser.ml"
    

let _menhir_action_30 =
  fun e1 e2 ->
    
# 67 "src/parser.mly"
                                                                  ( LETREC.Call_exp(e1, e2) )
# 789 "src/parser.ml"
    

let _menhir_action_31 =
  fun e ->
    
# 68 "src/parser.mly"
                               ( LETREC.Zero_exp(e))
# 797 "src/parser.ml"
    

let _menhir_action_32 =
  fun e1 e2 e3 ->
    
# 69 "src/parser.mly"
                                                                                          ( LETREC.If_exp(e1, e2, e3))
# 805 "src/parser.ml"
    

let _menhir_action_33 =
  fun e x ->
    
# 70 "src/parser.mly"
                                        ( LETREC.Proc_exp(x, e) )
# 813 "src/parser.ml"
    

let _menhir_action_34 =
  fun () ->
    
# 139 "<standard.mly>"
    ( [] )
# 821 "src/parser.ml"
    

let _menhir_action_35 =
  fun x ->
    
# 141 "<standard.mly>"
    ( x )
# 829 "src/parser.ml"
    

let _menhir_action_36 =
  fun () ->
    
# 139 "<standard.mly>"
    ( [] )
# 837 "src/parser.ml"
    

let _menhir_action_37 =
  fun x ->
    
# 141 "<standard.mly>"
    ( x )
# 845 "src/parser.ml"
    

let _menhir_action_38 =
  fun p ->
    
# 34 "src/parser.mly"
                         ( p )
# 853 "src/parser.ml"
    

let _menhir_action_39 =
  fun () ->
    
# 38 "src/parser.mly"
       ( EmptyProgram )
# 861 "src/parser.ml"
    

let _menhir_action_40 =
  fun e p ->
    
# 39 "src/parser.mly"
                                                         ( ProgramChain(Letrec(e), p) )
# 869 "src/parser.ml"
    

let _menhir_action_41 =
  fun e p ->
    
# 40 "src/parser.mly"
                                                       ( ProgramChain(Implicit(e), p) )
# 877 "src/parser.ml"
    

let _menhir_action_42 =
  fun e p ->
    
# 41 "src/parser.mly"
                                                           ( ProgramChain(Imperative(e), p) )
# 885 "src/parser.ml"
    

let _menhir_action_43 =
  fun x ->
    
# 238 "<standard.mly>"
    ( [ x ] )
# 893 "src/parser.ml"
    

let _menhir_action_44 =
  fun x xs ->
    
# 240 "<standard.mly>"
    ( x :: xs )
# 901 "src/parser.ml"
    

let _menhir_action_45 =
  fun x ->
    
# 238 "<standard.mly>"
    ( [ x ] )
# 909 "src/parser.ml"
    

let _menhir_action_46 =
  fun x xs ->
    
# 240 "<standard.mly>"
    ( x :: xs )
# 917 "src/parser.ml"
    

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | BEGIN ->
        "BEGIN"
    | DIFF ->
        "DIFF"
    | ELSE ->
        "ELSE"
    | END ->
        "END"
    | EOF ->
        "EOF"
    | EQUALS ->
        "EQUALS"
    | ID _ ->
        "ID"
    | IF ->
        "IF"
    | IMPERATIVE ->
        "IMPERATIVE"
    | IMPLICIT ->
        "IMPLICIT"
    | IN ->
        "IN"
    | INT _ ->
        "INT"
    | LET ->
        "LET"
    | LETREC ->
        "LETREC"
    | LETRECINTERP ->
        "LETRECINTERP"
    | LPAREN ->
        "LPAREN"
    | PROC ->
        "PROC"
    | RPAREN ->
        "RPAREN"
    | SEMICOLON ->
        "SEMICOLON"
    | SET ->
        "SET"
    | THEN ->
        "THEN"
    | ZERO ->
        "ZERO"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_134 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _v _tok ->
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let p = _v in
          let _v = _menhir_action_38 p in
          MenhirBox_prog _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_131 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_IMPERATIVE, _menhir_box_prog) _menhir_cell1_imperative_expression -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _v _tok ->
      let MenhirCell1_imperative_expression (_menhir_stack, _, e) = _menhir_stack in
      let MenhirCell1_IMPERATIVE (_menhir_stack, _menhir_s) = _menhir_stack in
      let p = _v in
      let _v = _menhir_action_42 e p in
      _menhir_goto_programChain _menhir_stack _v _menhir_s _tok
  
  and _menhir_goto_programChain : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState000 ->
          _menhir_run_134 _menhir_stack _v _tok
      | MenhirState044 ->
          _menhir_run_133 _menhir_stack _v _tok
      | MenhirState092 ->
          _menhir_run_132 _menhir_stack _v _tok
      | MenhirState129 ->
          _menhir_run_131 _menhir_stack _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_133 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_LETRECINTERP, _menhir_box_prog) _menhir_cell1_letrec_expression -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _v _tok ->
      let MenhirCell1_letrec_expression (_menhir_stack, _, e) = _menhir_stack in
      let MenhirCell1_LETRECINTERP (_menhir_stack, _menhir_s) = _menhir_stack in
      let p = _v in
      let _v = _menhir_action_40 e p in
      _menhir_goto_programChain _menhir_stack _v _menhir_s _tok
  
  and _menhir_run_132 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_IMPLICIT, _menhir_box_prog) _menhir_cell1_implicit_expression -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _v _tok ->
      let MenhirCell1_implicit_expression (_menhir_stack, _, e) = _menhir_stack in
      let MenhirCell1_IMPLICIT (_menhir_stack, _menhir_s) = _menhir_stack in
      let p = _v in
      let _v = _menhir_action_41 e p in
      _menhir_goto_programChain _menhir_stack _v _menhir_s _tok
  
  let rec _menhir_run_001 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LETRECINTERP (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState001
      | PROC ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState001
      | LPAREN ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState001
      | LETREC ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState001
      | LET ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState001
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_23 i in
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState001 _tok
      | IF ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState001
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_24 x in
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState001 _tok
      | BEGIN ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState001
      | _ ->
          _eRR ()
  
  and _menhir_run_002 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_ZERO (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState002
      | PROC ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState002
      | LPAREN ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState002
      | LETREC ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState002
      | LET ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState002
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_23 i in
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState002 _tok
      | IF ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState002
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_24 x in
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState002 _tok
      | BEGIN ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState002
      | _ ->
          _eRR ()
  
  and _menhir_run_003 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PROC (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ZERO ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState004
          | PROC ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState004
          | LPAREN ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState004
          | LETREC ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState004
          | LET ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState004
          | INT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_0 in
              let _v = _menhir_action_23 i in
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState004 _tok
          | IF ->
              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState004
          | ID _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_2 in
              let _v = _menhir_action_24 x in
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState004 _tok
          | BEGIN ->
              _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState004
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_005 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState005
      | PROC ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState005
      | LPAREN ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState005
      | LETREC ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState005
      | LET ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState005
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_23 i in
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState005 _tok
      | IF ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState005
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_24 x in
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState005 _tok
      | BEGIN ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState005
      | _ ->
          _eRR ()
  
  and _menhir_run_006 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LETREC (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | ID _v_0 ->
                  let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v_0) in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | RPAREN ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | EQUALS ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          (match (_tok : MenhirBasics.token) with
                          | ZERO ->
                              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState011
                          | PROC ->
                              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState011
                          | LPAREN ->
                              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState011
                          | LETREC ->
                              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState011
                          | LET ->
                              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState011
                          | INT _v_1 ->
                              let _tok = _menhir_lexer _menhir_lexbuf in
                              let i = _v_1 in
                              let _v = _menhir_action_23 i in
                              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState011 _tok
                          | IF ->
                              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState011
                          | ID _v_3 ->
                              let _tok = _menhir_lexer _menhir_lexbuf in
                              let x = _v_3 in
                              let _v = _menhir_action_24 x in
                              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState011 _tok
                          | BEGIN ->
                              _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState011
                          | _ ->
                              _eRR ())
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_012 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LET (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EQUALS ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | ZERO ->
                  _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState014
              | PROC ->
                  _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState014
              | LPAREN ->
                  _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState014
              | LETREC ->
                  _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState014
              | LET ->
                  _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState014
              | INT _v_0 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let i = _v_0 in
                  let _v = _menhir_action_23 i in
                  _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState014 _tok
              | IF ->
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState014
              | ID _v_2 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let x = _v_2 in
                  let _v = _menhir_action_24 x in
                  _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState014 _tok
              | BEGIN ->
                  _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState014
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_032 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_letrec_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | IN ->
          let _menhir_stack = MenhirCell1_IN (_menhir_stack, MenhirState032) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ZERO ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState033
          | PROC ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState033
          | LPAREN ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState033
          | LETREC ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState033
          | LET ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState033
          | INT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_0 in
              let _v = _menhir_action_23 i in
              _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState033 _tok
          | IF ->
              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState033
          | ID _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_2 in
              let _v = _menhir_action_24 x in
              _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState033 _tok
          | BEGIN ->
              _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState033
          | _ ->
              _eRR ())
      | DIFF ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState032
      | _ ->
          _eRR ()
  
  and _menhir_run_034 : type  ttv_stack. ((((ttv_stack, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_ID, _menhir_box_prog) _menhir_cell1_letrec_expression, _menhir_box_prog) _menhir_cell1_IN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DIFF ->
          let _menhir_stack = MenhirCell1_letrec_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState034
      | BEGIN | ELSE | END | EOF | ID _ | IF | IMPERATIVE | IMPLICIT | IN | INT _ | LET | LETREC | LETRECINTERP | LPAREN | PROC | RPAREN | SEMICOLON | THEN | ZERO ->
          let MenhirCell1_IN (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_letrec_expression (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell0_ID (_menhir_stack, x) = _menhir_stack in
          let MenhirCell1_LET (_menhir_stack, _menhir_s) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_26 e1 e2 x in
          _menhir_goto_letrec_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_025 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_letrec_expression as 'stack) -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_DIFF (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState025
      | PROC ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState025
      | LPAREN ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState025
      | LETREC ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState025
      | LET ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState025
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_23 i in
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState025 _tok
      | IF ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState025
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_24 x in
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState025 _tok
      | BEGIN ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState025
      | _ ->
          _eRR ()
  
  and _menhir_run_026 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_letrec_expression, _menhir_box_prog) _menhir_cell1_DIFF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DIFF ->
          let _menhir_stack = MenhirCell1_letrec_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState026
      | BEGIN | ELSE | END | EOF | ID _ | IF | IMPERATIVE | IMPLICIT | IN | INT _ | LET | LETREC | LETRECINTERP | LPAREN | PROC | RPAREN | SEMICOLON | THEN | ZERO ->
          let MenhirCell1_DIFF (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_letrec_expression (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_25 e1 e2 in
          _menhir_goto_letrec_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_letrec_expression : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState001 ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState002 ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState004 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState038 ->
          _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState005 ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState036 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState011 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState033 ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState014 ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState030 ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState028 ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState016 ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState025 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState023 ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState018 ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_044 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_LETRECINTERP as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_letrec_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | LETRECINTERP ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState044
      | IMPLICIT ->
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState044
      | IMPERATIVE ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState044
      | EOF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_39 () in
          _menhir_run_133 _menhir_stack _v _tok
      | DIFF ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState044
      | _ ->
          _eRR ()
  
  and _menhir_run_045 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IMPLICIT (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState045
      | SET ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState045
      | PROC ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState045
      | LPAREN ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState045
      | LETREC ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState045
      | LET ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState045
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_11 i in
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState045 _tok
      | IF ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState045
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_12 x in
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState045 _tok
      | BEGIN ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState045
      | _ ->
          _eRR ()
  
  and _menhir_run_046 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_ZERO (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState046
      | SET ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState046
      | PROC ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState046
      | LPAREN ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState046
      | LETREC ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState046
      | LET ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState046
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_11 i in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState046 _tok
      | IF ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState046
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_12 x in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState046 _tok
      | BEGIN ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState046
      | _ ->
          _eRR ()
  
  and _menhir_run_047 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_SET (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EQUALS ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | ZERO ->
                  _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState049
              | SET ->
                  _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState049
              | PROC ->
                  _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState049
              | LPAREN ->
                  _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState049
              | LETREC ->
                  _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState049
              | LET ->
                  _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState049
              | INT _v_0 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let i = _v_0 in
                  let _v = _menhir_action_11 i in
                  _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState049 _tok
              | IF ->
                  _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState049
              | ID _v_2 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let x = _v_2 in
                  let _v = _menhir_action_12 x in
                  _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState049 _tok
              | BEGIN ->
                  _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState049
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_050 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PROC (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ZERO ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
          | SET ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
          | PROC ->
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
          | LPAREN ->
              _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
          | LETREC ->
              _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
          | LET ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
          | INT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_0 in
              let _v = _menhir_action_11 i in
              _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState051 _tok
          | IF ->
              _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
          | ID _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_2 in
              let _v = _menhir_action_12 x in
              _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState051 _tok
          | BEGIN ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_052 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
      | SET ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
      | PROC ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
      | LPAREN ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
      | LETREC ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
      | LET ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_11 i in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState052 _tok
      | IF ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_12 x in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState052 _tok
      | BEGIN ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
      | _ ->
          _eRR ()
  
  and _menhir_run_053 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LETREC (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | ID _v_0 ->
                  let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v_0) in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | RPAREN ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | EQUALS ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          (match (_tok : MenhirBasics.token) with
                          | ZERO ->
                              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
                          | SET ->
                              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
                          | PROC ->
                              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
                          | LPAREN ->
                              _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
                          | LETREC ->
                              _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
                          | LET ->
                              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
                          | INT _v_1 ->
                              let _tok = _menhir_lexer _menhir_lexbuf in
                              let i = _v_1 in
                              let _v = _menhir_action_11 i in
                              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState058 _tok
                          | IF ->
                              _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
                          | ID _v_3 ->
                              let _tok = _menhir_lexer _menhir_lexbuf in
                              let x = _v_3 in
                              let _v = _menhir_action_12 x in
                              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState058 _tok
                          | BEGIN ->
                              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
                          | _ ->
                              _eRR ())
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_059 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LET (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EQUALS ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | ZERO ->
                  _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState061
              | SET ->
                  _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState061
              | PROC ->
                  _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState061
              | LPAREN ->
                  _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState061
              | LETREC ->
                  _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState061
              | LET ->
                  _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState061
              | INT _v_0 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let i = _v_0 in
                  let _v = _menhir_action_11 i in
                  _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState061 _tok
              | IF ->
                  _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState061
              | ID _v_2 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let x = _v_2 in
                  let _v = _menhir_action_12 x in
                  _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState061 _tok
              | BEGIN ->
                  _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState061
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_079 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_implicit_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | IN ->
          let _menhir_stack = MenhirCell1_IN (_menhir_stack, MenhirState079) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ZERO ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState080
          | SET ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState080
          | PROC ->
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState080
          | LPAREN ->
              _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState080
          | LETREC ->
              _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState080
          | LET ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState080
          | INT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_0 in
              let _v = _menhir_action_11 i in
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState080 _tok
          | IF ->
              _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState080
          | ID _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_2 in
              let _v = _menhir_action_12 x in
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState080 _tok
          | BEGIN ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState080
          | _ ->
              _eRR ())
      | DIFF ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState079
      | _ ->
          _eRR ()
  
  and _menhir_run_081 : type  ttv_stack. ((((ttv_stack, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_ID, _menhir_box_prog) _menhir_cell1_implicit_expression, _menhir_box_prog) _menhir_cell1_IN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DIFF ->
          let _menhir_stack = MenhirCell1_implicit_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState081
      | BEGIN | ELSE | END | EOF | ID _ | IF | IMPERATIVE | IMPLICIT | IN | INT _ | LET | LETREC | LETRECINTERP | LPAREN | PROC | RPAREN | SEMICOLON | SET | THEN | ZERO ->
          let MenhirCell1_IN (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_implicit_expression (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell0_ID (_menhir_stack, x) = _menhir_stack in
          let MenhirCell1_LET (_menhir_stack, _menhir_s) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_15 e1 e2 x in
          _menhir_goto_implicit_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_072 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_implicit_expression as 'stack) -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_DIFF (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState072
      | SET ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState072
      | PROC ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState072
      | LPAREN ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState072
      | LETREC ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState072
      | LET ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState072
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_11 i in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState072 _tok
      | IF ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState072
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_12 x in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState072 _tok
      | BEGIN ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState072
      | _ ->
          _eRR ()
  
  and _menhir_run_073 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_implicit_expression, _menhir_box_prog) _menhir_cell1_DIFF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DIFF ->
          let _menhir_stack = MenhirCell1_implicit_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState073
      | BEGIN | ELSE | END | EOF | ID _ | IF | IMPERATIVE | IMPLICIT | IN | INT _ | LET | LETREC | LETRECINTERP | LPAREN | PROC | RPAREN | SEMICOLON | SET | THEN | ZERO ->
          let MenhirCell1_DIFF (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_implicit_expression (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_13 e1 e2 in
          _menhir_goto_implicit_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_implicit_expression : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState045 ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState046 ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState049 ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState051 ->
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState085 ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState052 ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState083 ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState058 ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState080 ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState061 ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState077 ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState075 ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState063 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState072 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState070 ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState065 ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_092 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_IMPLICIT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_implicit_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | LETRECINTERP ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState092
      | IMPLICIT ->
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState092
      | IMPERATIVE ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState092
      | EOF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_39 () in
          _menhir_run_132 _menhir_stack _v _tok
      | DIFF ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState092
      | _ ->
          _eRR ()
  
  and _menhir_run_093 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IMPERATIVE (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState093
      | PROC ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState093
      | LPAREN ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState093
      | LETREC ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState093
      | LET ->
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState093
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_01 i in
          _menhir_run_129 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState093 _tok
      | IF ->
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState093
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_02 x in
          _menhir_run_129 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState093 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_094 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_ZERO (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState094
      | PROC ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState094
      | LPAREN ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState094
      | LETREC ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState094
      | LET ->
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState094
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_01 i in
          _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState094 _tok
      | IF ->
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState094
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_02 x in
          _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState094 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_095 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PROC (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ZERO ->
              _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState096
          | PROC ->
              _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState096
          | LPAREN ->
              _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState096
          | LETREC ->
              _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState096
          | LET ->
              _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState096
          | INT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_0 in
              let _v = _menhir_action_01 i in
              _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState096 _tok
          | IF ->
              _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState096
          | ID _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_2 in
              let _v = _menhir_action_02 x in
              _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState096 _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_097 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState097
      | PROC ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState097
      | LPAREN ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState097
      | LETREC ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState097
      | LET ->
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState097
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_01 i in
          _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState097 _tok
      | IF ->
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState097
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_02 x in
          _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState097 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_098 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LETREC (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | ID _v_0 ->
                  let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v_0) in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | RPAREN ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | EQUALS ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          (match (_tok : MenhirBasics.token) with
                          | ZERO ->
                              _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState103
                          | PROC ->
                              _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState103
                          | LPAREN ->
                              _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState103
                          | LETREC ->
                              _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState103
                          | LET ->
                              _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState103
                          | INT _v_1 ->
                              let _tok = _menhir_lexer _menhir_lexbuf in
                              let i = _v_1 in
                              let _v = _menhir_action_01 i in
                              _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState103 _tok
                          | IF ->
                              _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState103
                          | ID _v_3 ->
                              let _tok = _menhir_lexer _menhir_lexbuf in
                              let x = _v_3 in
                              let _v = _menhir_action_02 x in
                              _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState103 _tok
                          | _ ->
                              _eRR ())
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_104 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LET (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EQUALS ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | ZERO ->
                  _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState106
              | PROC ->
                  _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState106
              | LPAREN ->
                  _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState106
              | LETREC ->
                  _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState106
              | LET ->
                  _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState106
              | INT _v_0 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let i = _v_0 in
                  let _v = _menhir_action_01 i in
                  _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState106 _tok
              | IF ->
                  _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState106
              | ID _v_2 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let x = _v_2 in
                  let _v = _menhir_action_02 x in
                  _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState106 _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_117 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_imperative_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | IN ->
          let _menhir_stack = MenhirCell1_IN (_menhir_stack, MenhirState117) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ZERO ->
              _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState118
          | PROC ->
              _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState118
          | LPAREN ->
              _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState118
          | LETREC ->
              _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState118
          | LET ->
              _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState118
          | INT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_0 in
              let _v = _menhir_action_01 i in
              _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState118 _tok
          | IF ->
              _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState118
          | ID _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_2 in
              let _v = _menhir_action_02 x in
              _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState118 _tok
          | _ ->
              _eRR ())
      | DIFF ->
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState117
      | _ ->
          _eRR ()
  
  and _menhir_run_119 : type  ttv_stack. ((((ttv_stack, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_ID, _menhir_box_prog) _menhir_cell1_imperative_expression, _menhir_box_prog) _menhir_cell1_IN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DIFF ->
          let _menhir_stack = MenhirCell1_imperative_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState119
      | ELSE | EOF | ID _ | IF | IMPERATIVE | IMPLICIT | IN | INT _ | LET | LETREC | LETRECINTERP | LPAREN | PROC | RPAREN | THEN | ZERO ->
          let MenhirCell1_IN (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_imperative_expression (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell0_ID (_menhir_stack, x) = _menhir_stack in
          let MenhirCell1_LET (_menhir_stack, _menhir_s) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_04 e1 e2 x in
          _menhir_goto_imperative_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_115 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_imperative_expression as 'stack) -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_DIFF (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState115
      | PROC ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState115
      | LPAREN ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState115
      | LETREC ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState115
      | LET ->
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState115
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_01 i in
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState115 _tok
      | IF ->
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState115
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_02 x in
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState115 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_116 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_imperative_expression, _menhir_box_prog) _menhir_cell1_DIFF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DIFF ->
          let _menhir_stack = MenhirCell1_imperative_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState116
      | ELSE | EOF | ID _ | IF | IMPERATIVE | IMPLICIT | IN | INT _ | LET | LETREC | LETRECINTERP | LPAREN | PROC | RPAREN | THEN | ZERO ->
          let MenhirCell1_DIFF (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_imperative_expression (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_03 e1 e2 in
          _menhir_goto_imperative_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_imperative_expression : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState093 ->
          _menhir_run_129 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState094 ->
          _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState096 ->
          _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState123 ->
          _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState097 ->
          _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState121 ->
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState103 ->
          _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState118 ->
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState106 ->
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState115 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState113 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState111 ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState108 ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_129 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_IMPERATIVE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_imperative_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | LETRECINTERP ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | IMPLICIT ->
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | IMPERATIVE ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | EOF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_39 () in
          _menhir_run_131 _menhir_stack _v _tok
      | DIFF ->
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | _ ->
          _eRR ()
  
  and _menhir_run_128 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_ZERO as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DIFF ->
          let _menhir_stack = MenhirCell1_imperative_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
      | ELSE | EOF | ID _ | IF | IMPERATIVE | IMPLICIT | IN | INT _ | LET | LETREC | LETRECINTERP | LPAREN | PROC | RPAREN | THEN | ZERO ->
          let MenhirCell1_ZERO (_menhir_stack, _menhir_s) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_08 e in
          _menhir_goto_imperative_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_127 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_PROC _menhir_cell0_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DIFF ->
          let _menhir_stack = MenhirCell1_imperative_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | ELSE | EOF | ID _ | IF | IMPERATIVE | IMPLICIT | IN | INT _ | LET | LETREC | LETRECINTERP | LPAREN | PROC | RPAREN | THEN | ZERO ->
          let MenhirCell0_ID (_menhir_stack, x) = _menhir_stack in
          let MenhirCell1_PROC (_menhir_stack, _menhir_s) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_10 e x in
          _menhir_goto_imperative_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_125 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_LPAREN, _menhir_box_prog) _menhir_cell1_imperative_expression as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_imperative_expression (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_07 e1 e2 in
          _menhir_goto_imperative_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | DIFF ->
          let _menhir_stack = MenhirCell1_imperative_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState125
      | _ ->
          _eRR ()
  
  and _menhir_run_123 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          let _menhir_stack = MenhirCell1_imperative_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState123
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_06 e in
          _menhir_goto_imperative_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | PROC ->
          let _menhir_stack = MenhirCell1_imperative_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState123
      | LPAREN ->
          let _menhir_stack = MenhirCell1_imperative_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState123
      | LETREC ->
          let _menhir_stack = MenhirCell1_imperative_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState123
      | LET ->
          let _menhir_stack = MenhirCell1_imperative_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState123
      | INT _v_0 ->
          let _menhir_stack = MenhirCell1_imperative_expression (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v_0 in
          let _v = _menhir_action_01 i in
          _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState123 _tok
      | IF ->
          let _menhir_stack = MenhirCell1_imperative_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState123
      | ID _v_2 ->
          let _menhir_stack = MenhirCell1_imperative_expression (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v_2 in
          let _v = _menhir_action_02 x in
          _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState123 _tok
      | DIFF ->
          let _menhir_stack = MenhirCell1_imperative_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState123
      | _ ->
          _eRR ()
  
  and _menhir_run_108 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState108
      | PROC ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState108
      | LPAREN ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState108
      | LETREC ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState108
      | LET ->
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState108
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_01 i in
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState108 _tok
      | IF ->
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState108
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_02 x in
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState108 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_110 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_imperative_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | THEN ->
          let _menhir_stack = MenhirCell1_THEN (_menhir_stack, MenhirState110) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ZERO ->
              _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState111
          | PROC ->
              _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState111
          | LPAREN ->
              _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState111
          | LETREC ->
              _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState111
          | LET ->
              _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState111
          | INT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_0 in
              let _v = _menhir_action_01 i in
              _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState111 _tok
          | IF ->
              _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState111
          | ID _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_2 in
              let _v = _menhir_action_02 x in
              _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState111 _tok
          | _ ->
              _eRR ())
      | DIFF ->
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
      | _ ->
          _eRR ()
  
  and _menhir_run_112 : type  ttv_stack. ((((ttv_stack, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_imperative_expression, _menhir_box_prog) _menhir_cell1_THEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_imperative_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ELSE ->
          let _menhir_stack = MenhirCell1_ELSE (_menhir_stack, MenhirState112) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ZERO ->
              _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState113
          | PROC ->
              _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState113
          | LPAREN ->
              _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState113
          | LETREC ->
              _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState113
          | LET ->
              _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState113
          | INT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_0 in
              let _v = _menhir_action_01 i in
              _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState113 _tok
          | IF ->
              _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState113
          | ID _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_2 in
              let _v = _menhir_action_02 x in
              _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState113 _tok
          | _ ->
              _eRR ())
      | DIFF ->
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState112
      | _ ->
          _eRR ()
  
  and _menhir_run_114 : type  ttv_stack. ((((((ttv_stack, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_imperative_expression, _menhir_box_prog) _menhir_cell1_THEN, _menhir_box_prog) _menhir_cell1_imperative_expression, _menhir_box_prog) _menhir_cell1_ELSE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DIFF ->
          let _menhir_stack = MenhirCell1_imperative_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState114
      | ELSE | EOF | ID _ | IF | IMPERATIVE | IMPLICIT | IN | INT _ | LET | LETREC | LETRECINTERP | LPAREN | PROC | RPAREN | THEN | ZERO ->
          let MenhirCell1_ELSE (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_imperative_expression (_menhir_stack, _, e2) = _menhir_stack in
          let MenhirCell1_THEN (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_imperative_expression (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
          let e3 = _v in
          let _v = _menhir_action_09 e1 e2 e3 in
          _menhir_goto_imperative_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_122 : type  ttv_stack. ((((ttv_stack, _menhir_box_prog) _menhir_cell1_LETREC _menhir_cell0_ID _menhir_cell0_ID, _menhir_box_prog) _menhir_cell1_imperative_expression, _menhir_box_prog) _menhir_cell1_IN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DIFF ->
          let _menhir_stack = MenhirCell1_imperative_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState122
      | ELSE | EOF | ID _ | IF | IMPERATIVE | IMPLICIT | IN | INT _ | LET | LETREC | LETRECINTERP | LPAREN | PROC | RPAREN | THEN | ZERO ->
          let MenhirCell1_IN (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_imperative_expression (_menhir_stack, _, proc) = _menhir_stack in
          let MenhirCell0_ID (_menhir_stack, bound) = _menhir_stack in
          let MenhirCell0_ID (_menhir_stack, x) = _menhir_stack in
          let MenhirCell1_LETREC (_menhir_stack, _menhir_s) = _menhir_stack in
          let letrec_body = _v in
          let _v = _menhir_action_05 bound letrec_body proc x in
          _menhir_goto_imperative_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_120 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_LETREC _menhir_cell0_ID _menhir_cell0_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_imperative_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | IN ->
          let _menhir_stack = MenhirCell1_IN (_menhir_stack, MenhirState120) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ZERO ->
              _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
          | PROC ->
              _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
          | LPAREN ->
              _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
          | LETREC ->
              _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
          | LET ->
              _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
          | INT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_0 in
              let _v = _menhir_action_01 i in
              _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState121 _tok
          | IF ->
              _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
          | ID _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_2 in
              let _v = _menhir_action_02 x in
              _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState121 _tok
          | _ ->
              _eRR ())
      | DIFF ->
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState120
      | _ ->
          _eRR ()
  
  and _menhir_run_091 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_ZERO as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DIFF ->
          let _menhir_stack = MenhirCell1_implicit_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState091
      | BEGIN | ELSE | END | EOF | ID _ | IF | IMPERATIVE | IMPLICIT | IN | INT _ | LET | LETREC | LETRECINTERP | LPAREN | PROC | RPAREN | SEMICOLON | SET | THEN | ZERO ->
          let MenhirCell1_ZERO (_menhir_stack, _menhir_s) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_20 e in
          _menhir_goto_implicit_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_090 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_SET _menhir_cell0_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DIFF ->
          let _menhir_stack = MenhirCell1_implicit_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState090
      | BEGIN | ELSE | END | EOF | ID _ | IF | IMPERATIVE | IMPLICIT | IN | INT _ | LET | LETREC | LETRECINTERP | LPAREN | PROC | RPAREN | SEMICOLON | SET | THEN | ZERO ->
          let MenhirCell0_ID (_menhir_stack, x) = _menhir_stack in
          let MenhirCell1_SET (_menhir_stack, _menhir_s) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_14 e x in
          _menhir_goto_implicit_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_089 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_PROC _menhir_cell0_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DIFF ->
          let _menhir_stack = MenhirCell1_implicit_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState089
      | BEGIN | ELSE | END | EOF | ID _ | IF | IMPERATIVE | IMPLICIT | IN | INT _ | LET | LETREC | LETRECINTERP | LPAREN | PROC | RPAREN | SEMICOLON | SET | THEN | ZERO ->
          let MenhirCell0_ID (_menhir_stack, x) = _menhir_stack in
          let MenhirCell1_PROC (_menhir_stack, _menhir_s) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_22 e x in
          _menhir_goto_implicit_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_087 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_LPAREN, _menhir_box_prog) _menhir_cell1_implicit_expression as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_implicit_expression (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_19 e1 e2 in
          _menhir_goto_implicit_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | DIFF ->
          let _menhir_stack = MenhirCell1_implicit_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState087
      | _ ->
          _eRR ()
  
  and _menhir_run_085 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          let _menhir_stack = MenhirCell1_implicit_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState085
      | SET ->
          let _menhir_stack = MenhirCell1_implicit_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState085
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_18 e in
          _menhir_goto_implicit_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | PROC ->
          let _menhir_stack = MenhirCell1_implicit_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState085
      | LPAREN ->
          let _menhir_stack = MenhirCell1_implicit_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState085
      | LETREC ->
          let _menhir_stack = MenhirCell1_implicit_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState085
      | LET ->
          let _menhir_stack = MenhirCell1_implicit_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState085
      | INT _v_0 ->
          let _menhir_stack = MenhirCell1_implicit_expression (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v_0 in
          let _v = _menhir_action_11 i in
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState085 _tok
      | IF ->
          let _menhir_stack = MenhirCell1_implicit_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState085
      | ID _v_2 ->
          let _menhir_stack = MenhirCell1_implicit_expression (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v_2 in
          let _v = _menhir_action_12 x in
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState085 _tok
      | DIFF ->
          let _menhir_stack = MenhirCell1_implicit_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState085
      | BEGIN ->
          let _menhir_stack = MenhirCell1_implicit_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState085
      | _ ->
          _eRR ()
  
  and _menhir_run_063 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState063
      | SET ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState063
      | PROC ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState063
      | LPAREN ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState063
      | LETREC ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState063
      | LET ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState063
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_11 i in
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState063 _tok
      | IF ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState063
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_12 x in
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState063 _tok
      | BEGIN ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState063
      | _ ->
          _eRR ()
  
  and _menhir_run_074 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_implicit_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | THEN ->
          let _menhir_stack = MenhirCell1_THEN (_menhir_stack, MenhirState074) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ZERO ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
          | SET ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
          | PROC ->
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
          | LPAREN ->
              _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
          | LETREC ->
              _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
          | LET ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
          | INT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_0 in
              let _v = _menhir_action_11 i in
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState075 _tok
          | IF ->
              _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
          | ID _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_2 in
              let _v = _menhir_action_12 x in
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState075 _tok
          | BEGIN ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
          | _ ->
              _eRR ())
      | DIFF ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState074
      | _ ->
          _eRR ()
  
  and _menhir_run_076 : type  ttv_stack. ((((ttv_stack, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_implicit_expression, _menhir_box_prog) _menhir_cell1_THEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_implicit_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ELSE ->
          let _menhir_stack = MenhirCell1_ELSE (_menhir_stack, MenhirState076) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ZERO ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState077
          | SET ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState077
          | PROC ->
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState077
          | LPAREN ->
              _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState077
          | LETREC ->
              _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState077
          | LET ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState077
          | INT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_0 in
              let _v = _menhir_action_11 i in
              _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState077 _tok
          | IF ->
              _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState077
          | ID _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_2 in
              let _v = _menhir_action_12 x in
              _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState077 _tok
          | BEGIN ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState077
          | _ ->
              _eRR ())
      | DIFF ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState076
      | _ ->
          _eRR ()
  
  and _menhir_run_078 : type  ttv_stack. ((((((ttv_stack, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_implicit_expression, _menhir_box_prog) _menhir_cell1_THEN, _menhir_box_prog) _menhir_cell1_implicit_expression, _menhir_box_prog) _menhir_cell1_ELSE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DIFF ->
          let _menhir_stack = MenhirCell1_implicit_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState078
      | BEGIN | ELSE | END | EOF | ID _ | IF | IMPERATIVE | IMPLICIT | IN | INT _ | LET | LETREC | LETRECINTERP | LPAREN | PROC | RPAREN | SEMICOLON | SET | THEN | ZERO ->
          let MenhirCell1_ELSE (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_implicit_expression (_menhir_stack, _, e2) = _menhir_stack in
          let MenhirCell1_THEN (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_implicit_expression (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
          let e3 = _v in
          let _v = _menhir_action_21 e1 e2 e3 in
          _menhir_goto_implicit_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_065 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_BEGIN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState065
      | SET ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState065
      | PROC ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState065
      | LPAREN ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState065
      | LETREC ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState065
      | LET ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState065
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_11 i in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState065 _tok
      | IF ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState065
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_12 x in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState065 _tok
      | BEGIN ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState065
      | END ->
          let _v = _menhir_action_34 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_069 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          let _menhir_stack = MenhirCell1_implicit_expression (_menhir_stack, _menhir_s, _v) in
          let _menhir_stack = MenhirCell1_SEMICOLON (_menhir_stack, MenhirState069) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ZERO ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState070
          | SET ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState070
          | PROC ->
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState070
          | LPAREN ->
              _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState070
          | LETREC ->
              _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState070
          | LET ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState070
          | INT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_0 in
              let _v = _menhir_action_11 i in
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState070 _tok
          | IF ->
              _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState070
          | ID _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_2 in
              let _v = _menhir_action_12 x in
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState070 _tok
          | BEGIN ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState070
          | _ ->
              _eRR ())
      | DIFF ->
          let _menhir_stack = MenhirCell1_implicit_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | END ->
          let x = _v in
          let _v = _menhir_action_43 x in
          _menhir_goto_separated_nonempty_list_SEMICOLON_implicit_expression_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_SEMICOLON_implicit_expression_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState070 ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState065 ->
          _menhir_run_066_spec_065 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_071 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_implicit_expression, _menhir_box_prog) _menhir_cell1_SEMICOLON -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_SEMICOLON (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_implicit_expression (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_44 x xs in
      _menhir_goto_separated_nonempty_list_SEMICOLON_implicit_expression_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_066_spec_065 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_BEGIN -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let x = _v in
      let _v = _menhir_action_35 x in
      _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v
  
  and _menhir_run_067 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_BEGIN -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_BEGIN (_menhir_stack, _menhir_s) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_17 xs in
      _menhir_goto_implicit_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_084 : type  ttv_stack. ((((ttv_stack, _menhir_box_prog) _menhir_cell1_LETREC _menhir_cell0_ID _menhir_cell0_ID, _menhir_box_prog) _menhir_cell1_implicit_expression, _menhir_box_prog) _menhir_cell1_IN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DIFF ->
          let _menhir_stack = MenhirCell1_implicit_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState084
      | BEGIN | ELSE | END | EOF | ID _ | IF | IMPERATIVE | IMPLICIT | IN | INT _ | LET | LETREC | LETRECINTERP | LPAREN | PROC | RPAREN | SEMICOLON | SET | THEN | ZERO ->
          let MenhirCell1_IN (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_implicit_expression (_menhir_stack, _, proc) = _menhir_stack in
          let MenhirCell0_ID (_menhir_stack, bound) = _menhir_stack in
          let MenhirCell0_ID (_menhir_stack, x) = _menhir_stack in
          let MenhirCell1_LETREC (_menhir_stack, _menhir_s) = _menhir_stack in
          let letrec_body = _v in
          let _v = _menhir_action_16 bound letrec_body proc x in
          _menhir_goto_implicit_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_082 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_LETREC _menhir_cell0_ID _menhir_cell0_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_implicit_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | IN ->
          let _menhir_stack = MenhirCell1_IN (_menhir_stack, MenhirState082) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ZERO ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState083
          | SET ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState083
          | PROC ->
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState083
          | LPAREN ->
              _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState083
          | LETREC ->
              _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState083
          | LET ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState083
          | INT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_0 in
              let _v = _menhir_action_11 i in
              _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState083 _tok
          | IF ->
              _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState083
          | ID _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_2 in
              let _v = _menhir_action_12 x in
              _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState083 _tok
          | BEGIN ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState083
          | _ ->
              _eRR ())
      | DIFF ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState082
      | _ ->
          _eRR ()
  
  and _menhir_run_043 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_ZERO as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DIFF ->
          let _menhir_stack = MenhirCell1_letrec_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState043
      | BEGIN | ELSE | END | EOF | ID _ | IF | IMPERATIVE | IMPLICIT | IN | INT _ | LET | LETREC | LETRECINTERP | LPAREN | PROC | RPAREN | SEMICOLON | THEN | ZERO ->
          let MenhirCell1_ZERO (_menhir_stack, _menhir_s) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_31 e in
          _menhir_goto_letrec_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_042 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_PROC _menhir_cell0_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DIFF ->
          let _menhir_stack = MenhirCell1_letrec_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState042
      | BEGIN | ELSE | END | EOF | ID _ | IF | IMPERATIVE | IMPLICIT | IN | INT _ | LET | LETREC | LETRECINTERP | LPAREN | PROC | RPAREN | SEMICOLON | THEN | ZERO ->
          let MenhirCell0_ID (_menhir_stack, x) = _menhir_stack in
          let MenhirCell1_PROC (_menhir_stack, _menhir_s) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_33 e x in
          _menhir_goto_letrec_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_040 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_LPAREN, _menhir_box_prog) _menhir_cell1_letrec_expression as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_letrec_expression (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_30 e1 e2 in
          _menhir_goto_letrec_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | DIFF ->
          let _menhir_stack = MenhirCell1_letrec_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState040
      | _ ->
          _eRR ()
  
  and _menhir_run_038 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          let _menhir_stack = MenhirCell1_letrec_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState038
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_29 e in
          _menhir_goto_letrec_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | PROC ->
          let _menhir_stack = MenhirCell1_letrec_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState038
      | LPAREN ->
          let _menhir_stack = MenhirCell1_letrec_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState038
      | LETREC ->
          let _menhir_stack = MenhirCell1_letrec_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState038
      | LET ->
          let _menhir_stack = MenhirCell1_letrec_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState038
      | INT _v_0 ->
          let _menhir_stack = MenhirCell1_letrec_expression (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v_0 in
          let _v = _menhir_action_23 i in
          _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState038 _tok
      | IF ->
          let _menhir_stack = MenhirCell1_letrec_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState038
      | ID _v_2 ->
          let _menhir_stack = MenhirCell1_letrec_expression (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v_2 in
          let _v = _menhir_action_24 x in
          _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState038 _tok
      | DIFF ->
          let _menhir_stack = MenhirCell1_letrec_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState038
      | BEGIN ->
          let _menhir_stack = MenhirCell1_letrec_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState038
      | _ ->
          _eRR ()
  
  and _menhir_run_016 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState016
      | PROC ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState016
      | LPAREN ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState016
      | LETREC ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState016
      | LET ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState016
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_23 i in
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState016 _tok
      | IF ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState016
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_24 x in
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState016 _tok
      | BEGIN ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState016
      | _ ->
          _eRR ()
  
  and _menhir_run_027 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_letrec_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | THEN ->
          let _menhir_stack = MenhirCell1_THEN (_menhir_stack, MenhirState027) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ZERO ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState028
          | PROC ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState028
          | LPAREN ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState028
          | LETREC ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState028
          | LET ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState028
          | INT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_0 in
              let _v = _menhir_action_23 i in
              _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState028 _tok
          | IF ->
              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState028
          | ID _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_2 in
              let _v = _menhir_action_24 x in
              _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState028 _tok
          | BEGIN ->
              _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState028
          | _ ->
              _eRR ())
      | DIFF ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState027
      | _ ->
          _eRR ()
  
  and _menhir_run_029 : type  ttv_stack. ((((ttv_stack, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_letrec_expression, _menhir_box_prog) _menhir_cell1_THEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_letrec_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ELSE ->
          let _menhir_stack = MenhirCell1_ELSE (_menhir_stack, MenhirState029) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ZERO ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
          | PROC ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
          | LPAREN ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
          | LETREC ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
          | LET ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
          | INT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_0 in
              let _v = _menhir_action_23 i in
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState030 _tok
          | IF ->
              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
          | ID _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_2 in
              let _v = _menhir_action_24 x in
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState030 _tok
          | BEGIN ->
              _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
          | _ ->
              _eRR ())
      | DIFF ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState029
      | _ ->
          _eRR ()
  
  and _menhir_run_031 : type  ttv_stack. ((((((ttv_stack, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_letrec_expression, _menhir_box_prog) _menhir_cell1_THEN, _menhir_box_prog) _menhir_cell1_letrec_expression, _menhir_box_prog) _menhir_cell1_ELSE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DIFF ->
          let _menhir_stack = MenhirCell1_letrec_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState031
      | BEGIN | ELSE | END | EOF | ID _ | IF | IMPERATIVE | IMPLICIT | IN | INT _ | LET | LETREC | LETRECINTERP | LPAREN | PROC | RPAREN | SEMICOLON | THEN | ZERO ->
          let MenhirCell1_ELSE (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_letrec_expression (_menhir_stack, _, e2) = _menhir_stack in
          let MenhirCell1_THEN (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_letrec_expression (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
          let e3 = _v in
          let _v = _menhir_action_32 e1 e2 e3 in
          _menhir_goto_letrec_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_018 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_BEGIN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
      | PROC ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
      | LPAREN ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
      | LETREC ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
      | LET ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_23 i in
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState018 _tok
      | IF ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_24 x in
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState018 _tok
      | BEGIN ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
      | END ->
          let _v = _menhir_action_36 () in
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_022 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          let _menhir_stack = MenhirCell1_letrec_expression (_menhir_stack, _menhir_s, _v) in
          let _menhir_stack = MenhirCell1_SEMICOLON (_menhir_stack, MenhirState022) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ZERO ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState023
          | PROC ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState023
          | LPAREN ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState023
          | LETREC ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState023
          | LET ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState023
          | INT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_0 in
              let _v = _menhir_action_23 i in
              _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState023 _tok
          | IF ->
              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState023
          | ID _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_2 in
              let _v = _menhir_action_24 x in
              _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState023 _tok
          | BEGIN ->
              _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState023
          | _ ->
              _eRR ())
      | DIFF ->
          let _menhir_stack = MenhirCell1_letrec_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState022
      | END ->
          let x = _v in
          let _v = _menhir_action_45 x in
          _menhir_goto_separated_nonempty_list_SEMICOLON_letrec_expression_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_SEMICOLON_letrec_expression_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState023 ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState018 ->
          _menhir_run_019_spec_018 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_024 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_letrec_expression, _menhir_box_prog) _menhir_cell1_SEMICOLON -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_SEMICOLON (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_letrec_expression (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_46 x xs in
      _menhir_goto_separated_nonempty_list_SEMICOLON_letrec_expression_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_019_spec_018 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_BEGIN -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let x = _v in
      let _v = _menhir_action_37 x in
      _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _v
  
  and _menhir_run_020 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_BEGIN -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_BEGIN (_menhir_stack, _menhir_s) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_28 xs in
      _menhir_goto_letrec_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_037 : type  ttv_stack. ((((ttv_stack, _menhir_box_prog) _menhir_cell1_LETREC _menhir_cell0_ID _menhir_cell0_ID, _menhir_box_prog) _menhir_cell1_letrec_expression, _menhir_box_prog) _menhir_cell1_IN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DIFF ->
          let _menhir_stack = MenhirCell1_letrec_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState037
      | BEGIN | ELSE | END | EOF | ID _ | IF | IMPERATIVE | IMPLICIT | IN | INT _ | LET | LETREC | LETRECINTERP | LPAREN | PROC | RPAREN | SEMICOLON | THEN | ZERO ->
          let MenhirCell1_IN (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_letrec_expression (_menhir_stack, _, proc) = _menhir_stack in
          let MenhirCell0_ID (_menhir_stack, bound) = _menhir_stack in
          let MenhirCell0_ID (_menhir_stack, x) = _menhir_stack in
          let MenhirCell1_LETREC (_menhir_stack, _menhir_s) = _menhir_stack in
          let letrec_body = _v in
          let _v = _menhir_action_27 bound letrec_body proc x in
          _menhir_goto_letrec_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_035 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_LETREC _menhir_cell0_ID _menhir_cell0_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_letrec_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | IN ->
          let _menhir_stack = MenhirCell1_IN (_menhir_stack, MenhirState035) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ZERO ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState036
          | PROC ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState036
          | LPAREN ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState036
          | LETREC ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState036
          | LET ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState036
          | INT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_0 in
              let _v = _menhir_action_23 i in
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState036 _tok
          | IF ->
              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState036
          | ID _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_2 in
              let _v = _menhir_action_24 x in
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState036 _tok
          | BEGIN ->
              _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState036
          | _ ->
              _eRR ())
      | DIFF ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState035
      | _ ->
          _eRR ()
  
  let rec _menhir_run_000 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LETRECINTERP ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
      | IMPLICIT ->
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
      | IMPERATIVE ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
      | EOF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_39 () in
          _menhir_run_134 _menhir_stack _v _tok
      | _ ->
          _eRR ()
  
end

let prog =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_prog v = _menhir_run_000 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
