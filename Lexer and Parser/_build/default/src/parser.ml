
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | ZERO
    | THEN
    | SEMICOLON
    | RPAREN
    | PROC
    | LPAREN
    | LETREC
    | LET
    | INT of (
# 6 "src/parser.mly"
       (int)
# 23 "src/parser.ml"
  )
    | IN
    | IF
    | ID of (
# 7 "src/parser.mly"
       (string)
# 30 "src/parser.ml"
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
  
	open LETREC

# 47 "src/parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_prog) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: prog. *)

  | MenhirState01 : (('s, _menhir_box_prog) _menhir_cell1_ZERO, _menhir_box_prog) _menhir_state
    (** State 01.
        Stack shape : ZERO.
        Start symbol: prog. *)

  | MenhirState03 : (('s, _menhir_box_prog) _menhir_cell1_PROC _menhir_cell0_ID, _menhir_box_prog) _menhir_state
    (** State 03.
        Stack shape : PROC ID.
        Start symbol: prog. *)

  | MenhirState04 : (('s, _menhir_box_prog) _menhir_cell1_LPAREN, _menhir_box_prog) _menhir_state
    (** State 04.
        Stack shape : LPAREN.
        Start symbol: prog. *)

  | MenhirState10 : (('s, _menhir_box_prog) _menhir_cell1_LETREC _menhir_cell0_ID _menhir_cell0_ID, _menhir_box_prog) _menhir_state
    (** State 10.
        Stack shape : LETREC ID ID.
        Start symbol: prog. *)

  | MenhirState13 : (('s, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_ID, _menhir_box_prog) _menhir_state
    (** State 13.
        Stack shape : LET ID.
        Start symbol: prog. *)

  | MenhirState15 : (('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_state
    (** State 15.
        Stack shape : IF.
        Start symbol: prog. *)

  | MenhirState17 : (('s, _menhir_box_prog) _menhir_cell1_BEGIN, _menhir_box_prog) _menhir_state
    (** State 17.
        Stack shape : BEGIN.
        Start symbol: prog. *)

  | MenhirState21 : (('s, _menhir_box_prog) _menhir_cell1_expression, _menhir_box_prog) _menhir_state
    (** State 21.
        Stack shape : expression.
        Start symbol: prog. *)

  | MenhirState22 : ((('s, _menhir_box_prog) _menhir_cell1_expression, _menhir_box_prog) _menhir_cell1_SEMICOLON, _menhir_box_prog) _menhir_state
    (** State 22.
        Stack shape : expression SEMICOLON.
        Start symbol: prog. *)

  | MenhirState24 : ((('s, _menhir_box_prog) _menhir_cell1_expression, _menhir_box_prog) _menhir_cell1_DIFF, _menhir_box_prog) _menhir_state
    (** State 24.
        Stack shape : expression DIFF.
        Start symbol: prog. *)

  | MenhirState25 : (((('s, _menhir_box_prog) _menhir_cell1_expression, _menhir_box_prog) _menhir_cell1_DIFF, _menhir_box_prog) _menhir_cell1_expression, _menhir_box_prog) _menhir_state
    (** State 25.
        Stack shape : expression DIFF expression.
        Start symbol: prog. *)

  | MenhirState26 : ((('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_expression, _menhir_box_prog) _menhir_state
    (** State 26.
        Stack shape : IF expression.
        Start symbol: prog. *)

  | MenhirState27 : (((('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_expression, _menhir_box_prog) _menhir_cell1_THEN, _menhir_box_prog) _menhir_state
    (** State 27.
        Stack shape : IF expression THEN.
        Start symbol: prog. *)

  | MenhirState28 : ((((('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_expression, _menhir_box_prog) _menhir_cell1_THEN, _menhir_box_prog) _menhir_cell1_expression, _menhir_box_prog) _menhir_state
    (** State 28.
        Stack shape : IF expression THEN expression.
        Start symbol: prog. *)

  | MenhirState29 : (((((('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_expression, _menhir_box_prog) _menhir_cell1_THEN, _menhir_box_prog) _menhir_cell1_expression, _menhir_box_prog) _menhir_cell1_ELSE, _menhir_box_prog) _menhir_state
    (** State 29.
        Stack shape : IF expression THEN expression ELSE.
        Start symbol: prog. *)

  | MenhirState30 : ((((((('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_expression, _menhir_box_prog) _menhir_cell1_THEN, _menhir_box_prog) _menhir_cell1_expression, _menhir_box_prog) _menhir_cell1_ELSE, _menhir_box_prog) _menhir_cell1_expression, _menhir_box_prog) _menhir_state
    (** State 30.
        Stack shape : IF expression THEN expression ELSE expression.
        Start symbol: prog. *)

  | MenhirState31 : ((('s, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_ID, _menhir_box_prog) _menhir_cell1_expression, _menhir_box_prog) _menhir_state
    (** State 31.
        Stack shape : LET ID expression.
        Start symbol: prog. *)

  | MenhirState32 : (((('s, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_ID, _menhir_box_prog) _menhir_cell1_expression, _menhir_box_prog) _menhir_cell1_IN, _menhir_box_prog) _menhir_state
    (** State 32.
        Stack shape : LET ID expression IN.
        Start symbol: prog. *)

  | MenhirState33 : ((((('s, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_ID, _menhir_box_prog) _menhir_cell1_expression, _menhir_box_prog) _menhir_cell1_IN, _menhir_box_prog) _menhir_cell1_expression, _menhir_box_prog) _menhir_state
    (** State 33.
        Stack shape : LET ID expression IN expression.
        Start symbol: prog. *)

  | MenhirState34 : ((('s, _menhir_box_prog) _menhir_cell1_LETREC _menhir_cell0_ID _menhir_cell0_ID, _menhir_box_prog) _menhir_cell1_expression, _menhir_box_prog) _menhir_state
    (** State 34.
        Stack shape : LETREC ID ID expression.
        Start symbol: prog. *)

  | MenhirState35 : (((('s, _menhir_box_prog) _menhir_cell1_LETREC _menhir_cell0_ID _menhir_cell0_ID, _menhir_box_prog) _menhir_cell1_expression, _menhir_box_prog) _menhir_cell1_IN, _menhir_box_prog) _menhir_state
    (** State 35.
        Stack shape : LETREC ID ID expression IN.
        Start symbol: prog. *)

  | MenhirState36 : ((((('s, _menhir_box_prog) _menhir_cell1_LETREC _menhir_cell0_ID _menhir_cell0_ID, _menhir_box_prog) _menhir_cell1_expression, _menhir_box_prog) _menhir_cell1_IN, _menhir_box_prog) _menhir_cell1_expression, _menhir_box_prog) _menhir_state
    (** State 36.
        Stack shape : LETREC ID ID expression IN expression.
        Start symbol: prog. *)

  | MenhirState37 : ((('s, _menhir_box_prog) _menhir_cell1_LPAREN, _menhir_box_prog) _menhir_cell1_expression, _menhir_box_prog) _menhir_state
    (** State 37.
        Stack shape : LPAREN expression.
        Start symbol: prog. *)

  | MenhirState39 : (((('s, _menhir_box_prog) _menhir_cell1_LPAREN, _menhir_box_prog) _menhir_cell1_expression, _menhir_box_prog) _menhir_cell1_expression, _menhir_box_prog) _menhir_state
    (** State 39.
        Stack shape : LPAREN expression expression.
        Start symbol: prog. *)

  | MenhirState41 : ((('s, _menhir_box_prog) _menhir_cell1_PROC _menhir_cell0_ID, _menhir_box_prog) _menhir_cell1_expression, _menhir_box_prog) _menhir_state
    (** State 41.
        Stack shape : PROC ID expression.
        Start symbol: prog. *)

  | MenhirState42 : ((('s, _menhir_box_prog) _menhir_cell1_ZERO, _menhir_box_prog) _menhir_cell1_expression, _menhir_box_prog) _menhir_state
    (** State 42.
        Stack shape : ZERO expression.
        Start symbol: prog. *)

  | MenhirState44 : (('s, _menhir_box_prog) _menhir_cell1_expression, _menhir_box_prog) _menhir_state
    (** State 44.
        Stack shape : expression.
        Start symbol: prog. *)


and ('s, 'r) _menhir_cell1_expression = 
  | MenhirCell1_expression of 's * ('s, 'r) _menhir_state * (LETREC.expression)

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
# 207 "src/parser.ml"
)

and ('s, 'r) _menhir_cell1_IF = 
  | MenhirCell1_IF of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_IN = 
  | MenhirCell1_IN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LET = 
  | MenhirCell1_LET of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LETREC = 
  | MenhirCell1_LETREC of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LPAREN = 
  | MenhirCell1_LPAREN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_PROC = 
  | MenhirCell1_PROC of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_SEMICOLON = 
  | MenhirCell1_SEMICOLON of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_THEN = 
  | MenhirCell1_THEN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_ZERO = 
  | MenhirCell1_ZERO of 's * ('s, 'r) _menhir_state

and _menhir_box_prog = 
  | MenhirBox_prog of (LETREC.expression) [@@unboxed]

let _menhir_action_01 =
  fun i ->
    
# 34 "src/parser.mly"
            ( Const_exp(i) )
# 245 "src/parser.ml"
    

let _menhir_action_02 =
  fun x ->
    
# 35 "src/parser.mly"
          ( Var_exp(x) )
# 253 "src/parser.ml"
    

let _menhir_action_03 =
  fun e1 e2 ->
    
# 36 "src/parser.mly"
                                          ( Diff_exp(e1, e2) )
# 261 "src/parser.ml"
    

let _menhir_action_04 =
  fun e1 e2 x ->
    
# 37 "src/parser.mly"
                                                             ( Let_exp(x, e1, e2))
# 269 "src/parser.ml"
    

let _menhir_action_05 =
  fun bound letrec_body proc x ->
    
# 38 "src/parser.mly"
                                                                                                       ( Letrec_exp(x, bound, proc, letrec_body))
# 277 "src/parser.ml"
    

let _menhir_action_06 =
  fun xs ->
    let exp_list = 
# 229 "<standard.mly>"
    ( xs )
# 285 "src/parser.ml"
     in
    
# 39 "src/parser.mly"
                                                                ( Begin_exp(exp_list) )
# 290 "src/parser.ml"
    

let _menhir_action_07 =
  fun e ->
    
# 40 "src/parser.mly"
                                  ( e )
# 298 "src/parser.ml"
    

let _menhir_action_08 =
  fun e1 e2 ->
    
# 41 "src/parser.mly"
                                                    ( Call_exp(e1, e2) )
# 306 "src/parser.ml"
    

let _menhir_action_09 =
  fun e ->
    
# 42 "src/parser.mly"
                        ( Zero_exp(e))
# 314 "src/parser.ml"
    

let _menhir_action_10 =
  fun e1 e2 e3 ->
    
# 43 "src/parser.mly"
                                                                     ( If_exp(e1, e2, e3))
# 322 "src/parser.ml"
    

let _menhir_action_11 =
  fun e x ->
    
# 44 "src/parser.mly"
                                 ( Proc_exp(x, e) )
# 330 "src/parser.ml"
    

let _menhir_action_12 =
  fun () ->
    
# 139 "<standard.mly>"
    ( [] )
# 338 "src/parser.ml"
    

let _menhir_action_13 =
  fun x ->
    
# 141 "<standard.mly>"
    ( x )
# 346 "src/parser.ml"
    

let _menhir_action_14 =
  fun e ->
    
# 30 "src/parser.mly"
                       ( e )
# 354 "src/parser.ml"
    

let _menhir_action_15 =
  fun x ->
    
# 238 "<standard.mly>"
    ( [ x ] )
# 362 "src/parser.ml"
    

let _menhir_action_16 =
  fun x xs ->
    
# 240 "<standard.mly>"
    ( x :: xs )
# 370 "src/parser.ml"
    

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
    | IN ->
        "IN"
    | INT _ ->
        "INT"
    | LET ->
        "LET"
    | LETREC ->
        "LETREC"
    | LPAREN ->
        "LPAREN"
    | PROC ->
        "PROC"
    | RPAREN ->
        "RPAREN"
    | SEMICOLON ->
        "SEMICOLON"
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
  
  let rec _menhir_run_01 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_ZERO (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | PROC ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | LPAREN ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | LETREC ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | LET ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_01 i in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01 _tok
      | IF ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_02 x in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01 _tok
      | BEGIN ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | _ ->
          _eRR ()
  
  and _menhir_run_02 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PROC (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ZERO ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
          | PROC ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
          | LPAREN ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
          | LETREC ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
          | LET ->
              _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
          | INT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_0 in
              let _v = _menhir_action_01 i in
              _menhir_run_41 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState03 _tok
          | IF ->
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
          | ID _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_2 in
              let _v = _menhir_action_02 x in
              _menhir_run_41 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState03 _tok
          | BEGIN ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_04 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState04
      | PROC ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState04
      | LPAREN ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState04
      | LETREC ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState04
      | LET ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState04
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_01 i in
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState04 _tok
      | IF ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState04
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_02 x in
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState04 _tok
      | BEGIN ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState04
      | _ ->
          _eRR ()
  
  and _menhir_run_05 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
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
                              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState10
                          | PROC ->
                              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState10
                          | LPAREN ->
                              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState10
                          | LETREC ->
                              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState10
                          | LET ->
                              _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState10
                          | INT _v_1 ->
                              let _tok = _menhir_lexer _menhir_lexbuf in
                              let i = _v_1 in
                              let _v = _menhir_action_01 i in
                              _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState10 _tok
                          | IF ->
                              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState10
                          | ID _v_3 ->
                              let _tok = _menhir_lexer _menhir_lexbuf in
                              let x = _v_3 in
                              let _v = _menhir_action_02 x in
                              _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState10 _tok
                          | BEGIN ->
                              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState10
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
  
  and _menhir_run_11 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
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
                  _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
              | PROC ->
                  _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
              | LPAREN ->
                  _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
              | LETREC ->
                  _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
              | LET ->
                  _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
              | INT _v_0 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let i = _v_0 in
                  let _v = _menhir_action_01 i in
                  _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState13 _tok
              | IF ->
                  _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
              | ID _v_2 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let x = _v_2 in
                  let _v = _menhir_action_02 x in
                  _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState13 _tok
              | BEGIN ->
                  _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_31 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | IN ->
          let _menhir_stack = MenhirCell1_IN (_menhir_stack, MenhirState31) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ZERO ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
          | PROC ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
          | LPAREN ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
          | LETREC ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
          | LET ->
              _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
          | INT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_0 in
              let _v = _menhir_action_01 i in
              _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState32 _tok
          | IF ->
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
          | ID _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_2 in
              let _v = _menhir_action_02 x in
              _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState32 _tok
          | BEGIN ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
          | _ ->
              _eRR ())
      | DIFF ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState31
      | _ ->
          _eRR ()
  
  and _menhir_run_33 : type  ttv_stack. ((((ttv_stack, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_ID, _menhir_box_prog) _menhir_cell1_expression, _menhir_box_prog) _menhir_cell1_IN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DIFF ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState33
      | BEGIN | ELSE | END | EOF | ID _ | IF | IN | INT _ | LET | LETREC | LPAREN | PROC | RPAREN | SEMICOLON | THEN | ZERO ->
          let MenhirCell1_IN (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_expression (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell0_ID (_menhir_stack, x) = _menhir_stack in
          let MenhirCell1_LET (_menhir_stack, _menhir_s) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_04 e1 e2 x in
          _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_24 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expression as 'stack) -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_DIFF (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState24
      | PROC ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState24
      | LPAREN ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState24
      | LETREC ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState24
      | LET ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState24
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_01 i in
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState24 _tok
      | IF ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState24
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_02 x in
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState24 _tok
      | BEGIN ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState24
      | _ ->
          _eRR ()
  
  and _menhir_run_25 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_expression, _menhir_box_prog) _menhir_cell1_DIFF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DIFF ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState25
      | BEGIN | ELSE | END | EOF | ID _ | IF | IN | INT _ | LET | LETREC | LPAREN | PROC | RPAREN | SEMICOLON | THEN | ZERO ->
          let MenhirCell1_DIFF (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_expression (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_03 e1 e2 in
          _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_expression : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState01 ->
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState03 ->
          _menhir_run_41 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState37 ->
          _menhir_run_39 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState04 ->
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState35 ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState10 ->
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState32 ->
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState13 ->
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState29 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState27 ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState15 ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState24 ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState22 ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState17 ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_44 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let e = _v in
          let _v = _menhir_action_14 e in
          MenhirBox_prog _v
      | DIFF ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState44
      | _ ->
          _eRR ()
  
  and _menhir_run_42 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_ZERO as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DIFF ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
      | BEGIN | ELSE | END | EOF | ID _ | IF | IN | INT _ | LET | LETREC | LPAREN | PROC | RPAREN | SEMICOLON | THEN | ZERO ->
          let MenhirCell1_ZERO (_menhir_stack, _menhir_s) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_09 e in
          _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_41 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_PROC _menhir_cell0_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DIFF ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState41
      | BEGIN | ELSE | END | EOF | ID _ | IF | IN | INT _ | LET | LETREC | LPAREN | PROC | RPAREN | SEMICOLON | THEN | ZERO ->
          let MenhirCell0_ID (_menhir_stack, x) = _menhir_stack in
          let MenhirCell1_PROC (_menhir_stack, _menhir_s) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_11 e x in
          _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_39 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_LPAREN, _menhir_box_prog) _menhir_cell1_expression as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_expression (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_08 e1 e2 in
          _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | DIFF ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState39
      | _ ->
          _eRR ()
  
  and _menhir_run_37 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState37
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_07 e in
          _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | PROC ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState37
      | LPAREN ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState37
      | LETREC ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState37
      | LET ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState37
      | INT _v_0 ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v_0 in
          let _v = _menhir_action_01 i in
          _menhir_run_39 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState37 _tok
      | IF ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState37
      | ID _v_2 ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v_2 in
          let _v = _menhir_action_02 x in
          _menhir_run_39 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState37 _tok
      | DIFF ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState37
      | BEGIN ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState37
      | _ ->
          _eRR ()
  
  and _menhir_run_15 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState15
      | PROC ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState15
      | LPAREN ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState15
      | LETREC ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState15
      | LET ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState15
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_01 i in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState15 _tok
      | IF ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState15
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_02 x in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState15 _tok
      | BEGIN ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState15
      | _ ->
          _eRR ()
  
  and _menhir_run_26 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | THEN ->
          let _menhir_stack = MenhirCell1_THEN (_menhir_stack, MenhirState26) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ZERO ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
          | PROC ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
          | LPAREN ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
          | LETREC ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
          | LET ->
              _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
          | INT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_0 in
              let _v = _menhir_action_01 i in
              _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState27 _tok
          | IF ->
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
          | ID _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_2 in
              let _v = _menhir_action_02 x in
              _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState27 _tok
          | BEGIN ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
          | _ ->
              _eRR ())
      | DIFF ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState26
      | _ ->
          _eRR ()
  
  and _menhir_run_28 : type  ttv_stack. ((((ttv_stack, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_expression, _menhir_box_prog) _menhir_cell1_THEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ELSE ->
          let _menhir_stack = MenhirCell1_ELSE (_menhir_stack, MenhirState28) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ZERO ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState29
          | PROC ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState29
          | LPAREN ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState29
          | LETREC ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState29
          | LET ->
              _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState29
          | INT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_0 in
              let _v = _menhir_action_01 i in
              _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState29 _tok
          | IF ->
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState29
          | ID _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_2 in
              let _v = _menhir_action_02 x in
              _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState29 _tok
          | BEGIN ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState29
          | _ ->
              _eRR ())
      | DIFF ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | _ ->
          _eRR ()
  
  and _menhir_run_30 : type  ttv_stack. ((((((ttv_stack, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_expression, _menhir_box_prog) _menhir_cell1_THEN, _menhir_box_prog) _menhir_cell1_expression, _menhir_box_prog) _menhir_cell1_ELSE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DIFF ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | BEGIN | ELSE | END | EOF | ID _ | IF | IN | INT _ | LET | LETREC | LPAREN | PROC | RPAREN | SEMICOLON | THEN | ZERO ->
          let MenhirCell1_ELSE (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_expression (_menhir_stack, _, e2) = _menhir_stack in
          let MenhirCell1_THEN (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_expression (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
          let e3 = _v in
          let _v = _menhir_action_10 e1 e2 e3 in
          _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_17 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_BEGIN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | PROC ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | LPAREN ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | LETREC ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | LET ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_01 i in
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState17 _tok
      | IF ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_02 x in
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState17 _tok
      | BEGIN ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | END ->
          let _v = _menhir_action_12 () in
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_21 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          let _menhir_stack = MenhirCell1_SEMICOLON (_menhir_stack, MenhirState21) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ZERO ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
          | PROC ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
          | LPAREN ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
          | LETREC ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
          | LET ->
              _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
          | INT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_0 in
              let _v = _menhir_action_01 i in
              _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState22 _tok
          | IF ->
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
          | ID _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_2 in
              let _v = _menhir_action_02 x in
              _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState22 _tok
          | BEGIN ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
          | _ ->
              _eRR ())
      | DIFF ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState21
      | END ->
          let x = _v in
          let _v = _menhir_action_15 x in
          _menhir_goto_separated_nonempty_list_SEMICOLON_expression_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_SEMICOLON_expression_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState22 ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState17 ->
          _menhir_run_18_spec_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_23 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expression, _menhir_box_prog) _menhir_cell1_SEMICOLON -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_SEMICOLON (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_expression (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_16 x xs in
      _menhir_goto_separated_nonempty_list_SEMICOLON_expression_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_18_spec_17 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_BEGIN -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let x = _v in
      let _v = _menhir_action_13 x in
      _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v
  
  and _menhir_run_19 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_BEGIN -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_BEGIN (_menhir_stack, _menhir_s) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_06 xs in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_36 : type  ttv_stack. ((((ttv_stack, _menhir_box_prog) _menhir_cell1_LETREC _menhir_cell0_ID _menhir_cell0_ID, _menhir_box_prog) _menhir_cell1_expression, _menhir_box_prog) _menhir_cell1_IN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DIFF ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | BEGIN | ELSE | END | EOF | ID _ | IF | IN | INT _ | LET | LETREC | LPAREN | PROC | RPAREN | SEMICOLON | THEN | ZERO ->
          let MenhirCell1_IN (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_expression (_menhir_stack, _, proc) = _menhir_stack in
          let MenhirCell0_ID (_menhir_stack, bound) = _menhir_stack in
          let MenhirCell0_ID (_menhir_stack, x) = _menhir_stack in
          let MenhirCell1_LETREC (_menhir_stack, _menhir_s) = _menhir_stack in
          let letrec_body = _v in
          let _v = _menhir_action_05 bound letrec_body proc x in
          _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_34 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_LETREC _menhir_cell0_ID _menhir_cell0_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | IN ->
          let _menhir_stack = MenhirCell1_IN (_menhir_stack, MenhirState34) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ZERO ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState35
          | PROC ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState35
          | LPAREN ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState35
          | LETREC ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState35
          | LET ->
              _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState35
          | INT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_0 in
              let _v = _menhir_action_01 i in
              _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState35 _tok
          | IF ->
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState35
          | ID _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_2 in
              let _v = _menhir_action_02 x in
              _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState35 _tok
          | BEGIN ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState35
          | _ ->
              _eRR ())
      | DIFF ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState34
      | _ ->
          _eRR ()
  
  let rec _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ZERO ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | PROC ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | LPAREN ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | LETREC ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | LET ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_01 i in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | IF ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_02 x in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | BEGIN ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | _ ->
          _eRR ()
  
end

let prog =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_prog v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
