
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
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
    | INT of (
# 6 "src/parser.mly"
       (int)
# 28 "src/parser.ml"
  )
    | IN
    | IF
    | ID of (
# 7 "src/parser.mly"
       (string)
# 35 "src/parser.ml"
  )
    | EQUALS
    | EOF
    | ENDLANG
    | END
    | EMPTY
    | ELSE
    | DIFF
  
end

include MenhirBasics

# 1 "src/parser.mly"
  
	open Wittgenstein

# 53 "src/parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState01 : ('s, _menhir_box_prog) _menhir_state
    (** State 01.
        Stack shape : .
        Start symbol: prog. *)

  | MenhirState05 : (('s, _menhir_box_prog) _menhir_cell1_WORD _menhir_cell0_ID _menhir_cell0_INT, _menhir_box_prog) _menhir_state
    (** State 05.
        Stack shape : WORD ID INT.
        Start symbol: prog. *)

  | MenhirState09 : (('s, _menhir_box_prog) _menhir_cell1_language, _menhir_box_prog) _menhir_state
    (** State 09.
        Stack shape : language.
        Start symbol: prog. *)

  | MenhirState11 : ((('s, _menhir_box_prog) _menhir_cell1_language, _menhir_box_prog) _menhir_cell1_language, _menhir_box_prog) _menhir_state
    (** State 11.
        Stack shape : language language.
        Start symbol: prog. *)

  | MenhirState13 : (('s, _menhir_box_prog) _menhir_cell1_INT, _menhir_box_prog) _menhir_state
    (** State 13.
        Stack shape : INT.
        Start symbol: prog. *)

  | MenhirState17 : (((('s, _menhir_box_prog) _menhir_cell1_language, _menhir_box_prog) _menhir_cell1_language, _menhir_box_prog) _menhir_cell1_loption_separated_nonempty_list_SEMICOLON_INT__, _menhir_box_prog) _menhir_state
    (** State 17.
        Stack shape : language language loption(separated_nonempty_list(SEMICOLON,INT)).
        Start symbol: prog. *)

  | MenhirState19 : (('s, _menhir_box_prog) _menhir_cell1_ID, _menhir_box_prog) _menhir_state
    (** State 19.
        Stack shape : ID.
        Start symbol: prog. *)


and ('s, 'r) _menhir_cell1_language = 
  | MenhirCell1_language of 's * ('s, 'r) _menhir_state * (Wittgenstein.language)

and ('s, 'r) _menhir_cell1_loption_separated_nonempty_list_SEMICOLON_INT__ = 
  | MenhirCell1_loption_separated_nonempty_list_SEMICOLON_INT__ of 's * ('s, 'r) _menhir_state * (int list)

and ('s, 'r) _menhir_cell1_ID = 
  | MenhirCell1_ID of 's * ('s, 'r) _menhir_state * (
# 7 "src/parser.mly"
       (string)
# 102 "src/parser.ml"
)

and 's _menhir_cell0_ID = 
  | MenhirCell0_ID of 's * (
# 7 "src/parser.mly"
       (string)
# 109 "src/parser.ml"
)

and ('s, 'r) _menhir_cell1_INT = 
  | MenhirCell1_INT of 's * ('s, 'r) _menhir_state * (
# 6 "src/parser.mly"
       (int)
# 116 "src/parser.ml"
)

and 's _menhir_cell0_INT = 
  | MenhirCell0_INT of 's * (
# 6 "src/parser.mly"
       (int)
# 123 "src/parser.ml"
)

and ('s, 'r) _menhir_cell1_WORD = 
  | MenhirCell1_WORD of 's * ('s, 'r) _menhir_state

and _menhir_box_prog = 
  | MenhirBox_prog of (Wittgenstein.world) [@@unboxed]

let _menhir_action_01 =
  fun () ->
    
# 45 "src/parser.mly"
           ( EndOfLang )
# 137 "src/parser.ml"
    

let _menhir_action_02 =
  fun i rest x ->
    
# 46 "src/parser.mly"
                                                   ( Assign_exp(x, (Sensation(i)), rest) )
# 145 "src/parser.ml"
    

let _menhir_action_03 =
  fun () ->
    
# 139 "<standard.mly>"
    ( [] )
# 153 "src/parser.ml"
    

let _menhir_action_04 =
  fun x ->
    
# 141 "<standard.mly>"
    ( x )
# 161 "src/parser.ml"
    

let _menhir_action_05 =
  fun () ->
    
# 139 "<standard.mly>"
    ( [] )
# 169 "src/parser.ml"
    

let _menhir_action_06 =
  fun x ->
    
# 141 "<standard.mly>"
    ( x )
# 177 "src/parser.ml"
    

let _menhir_action_07 =
  fun w ->
    
# 36 "src/parser.mly"
                  ( w )
# 185 "src/parser.ml"
    

let _menhir_action_08 =
  fun x ->
    
# 238 "<standard.mly>"
    ( [ x ] )
# 193 "src/parser.ml"
    

let _menhir_action_09 =
  fun x xs ->
    
# 240 "<standard.mly>"
    ( x :: xs )
# 201 "src/parser.ml"
    

let _menhir_action_10 =
  fun x ->
    
# 238 "<standard.mly>"
    ( [ x ] )
# 209 "src/parser.ml"
    

let _menhir_action_11 =
  fun x xs ->
    
# 240 "<standard.mly>"
    ( x :: xs )
# 217 "src/parser.ml"
    

let _menhir_action_12 =
  fun priv_lang pub_lang xs xs_inlined1 ->
    let words =
      let xs = xs_inlined1 in
      
# 229 "<standard.mly>"
    ( xs )
# 227 "src/parser.ml"
      
    in
    let sensations = 
# 229 "<standard.mly>"
    ( xs )
# 233 "src/parser.ml"
     in
    
# 41 "src/parser.mly"
                                                                                            ( World(pub_lang, priv_lang, (Empty_exp), sensations, words) )
# 238 "src/parser.ml"
    

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | DIFF ->
        "DIFF"
    | ELSE ->
        "ELSE"
    | EMPTY ->
        "EMPTY"
    | END ->
        "END"
    | ENDLANG ->
        "ENDLANG"
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
    | LPAREN ->
        "LPAREN"
    | MEANING ->
        "MEANING"
    | OUTSIDE ->
        "OUTSIDE"
    | PRIVATE ->
        "PRIVATE"
    | PROC ->
        "PROC"
    | PUBLIC ->
        "PUBLIC"
    | RPAREN ->
        "RPAREN"
    | SEMICOLON ->
        "SEMICOLON"
    | SPEAK ->
        "SPEAK"
    | THEN ->
        "THEN"
    | WORD ->
        "WORD"
    | ZERO ->
        "ZERO"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_22 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_language, _menhir_box_prog) _menhir_cell1_language, _menhir_box_prog) _menhir_cell1_loption_separated_nonempty_list_SEMICOLON_INT__ -> _ -> _menhir_box_prog =
    fun _menhir_stack _v ->
      let MenhirCell1_loption_separated_nonempty_list_SEMICOLON_INT__ (_menhir_stack, _, xs) = _menhir_stack in
      let MenhirCell1_language (_menhir_stack, _, priv_lang) = _menhir_stack in
      let MenhirCell1_language (_menhir_stack, _, pub_lang) = _menhir_stack in
      let xs_inlined1 = _v in
      let _v = _menhir_action_12 priv_lang pub_lang xs xs_inlined1 in
      let w = _v in
      let _v = _menhir_action_07 w in
      MenhirBox_prog _v
  
  let rec _menhir_run_21_spec_17 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_language, _menhir_box_prog) _menhir_cell1_language, _menhir_box_prog) _menhir_cell1_loption_separated_nonempty_list_SEMICOLON_INT__ -> _ -> _menhir_box_prog =
    fun _menhir_stack _v ->
      let x = _v in
      let _v = _menhir_action_04 x in
      _menhir_run_22 _menhir_stack _v
  
  let rec _menhir_goto_separated_nonempty_list_SEMICOLON_ID_ : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState17 ->
          _menhir_run_21_spec_17 _menhir_stack _v
      | MenhirState19 ->
          _menhir_run_20 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_20 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_ID -> _ -> _menhir_box_prog =
    fun _menhir_stack _v ->
      let MenhirCell1_ID (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_09 x xs in
      _menhir_goto_separated_nonempty_list_SEMICOLON_ID_ _menhir_stack _v _menhir_s
  
  let rec _menhir_run_18 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v ->
              _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState19
          | _ ->
              _eRR ())
      | EOF ->
          let x = _v in
          let _v = _menhir_action_08 x in
          _menhir_goto_separated_nonempty_list_SEMICOLON_ID_ _menhir_stack _v _menhir_s
      | _ ->
          _eRR ()
  
  let rec _menhir_run_16 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_language, _menhir_box_prog) _menhir_cell1_language as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_loption_separated_nonempty_list_SEMICOLON_INT__ (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState17
      | EOF ->
          let _v = _menhir_action_03 () in
          _menhir_run_22 _menhir_stack _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_15_spec_11 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_language, _menhir_box_prog) _menhir_cell1_language -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let x = _v in
      let _v = _menhir_action_06 x in
      _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState11
  
  let rec _menhir_goto_separated_nonempty_list_SEMICOLON_INT_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState11 ->
          _menhir_run_15_spec_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState13 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_14 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_INT -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_INT (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_11 x xs in
      _menhir_goto_separated_nonempty_list_SEMICOLON_INT_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  let rec _menhir_run_12 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          let _menhir_stack = MenhirCell1_INT (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | INT _v ->
              _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState13
          | _ ->
              _eRR ())
      | SPEAK ->
          let x = _v in
          let _v = _menhir_action_10 x in
          _menhir_goto_separated_nonempty_list_SEMICOLON_INT_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  let rec _menhir_run_10 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_language as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_language (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | OUTSIDE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | INT _v ->
              _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState11
          | SPEAK ->
              let _v = _menhir_action_05 () in
              _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState11
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  let rec _menhir_run_02 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_WORD (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | MEANING ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INT _v_0 ->
                  let _menhir_stack = MenhirCell0_INT (_menhir_stack, _v_0) in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | WORD ->
                      _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState05
                  | ENDLANG ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let _v = _menhir_action_01 () in
                      _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_07 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_WORD _menhir_cell0_ID _menhir_cell0_INT -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_INT (_menhir_stack, i) = _menhir_stack in
      let MenhirCell0_ID (_menhir_stack, x) = _menhir_stack in
      let MenhirCell1_WORD (_menhir_stack, _menhir_s) = _menhir_stack in
      let rest = _v in
      let _v = _menhir_action_02 i rest x in
      _menhir_goto_language _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_language : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState09 ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState01 ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState05 ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_08 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_language (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | PRIVATE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | WORD ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
          | ENDLANG ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_01 () in
              _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState09 _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  let rec _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PUBLIC ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | WORD ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
          | ENDLANG ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_01 () in
              _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01 _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
end

let prog =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_prog v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
