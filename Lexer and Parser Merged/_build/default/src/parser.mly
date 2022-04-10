%{
	open ProgramTypes
%}


%token <int> INT
%token <string> ID
%token LET
%token IN
%token IF 
%token THEN
%token ELSE
%token ZERO
%token EQUALS
%token DIFF
%token PROC
%token LPAREN
%token RPAREN
%token EOF
%token LETREC
%token BEGIN
%token END
%token SEMICOLON
%token SET
%token LETRECINTERP
%token IMPLICIT 
%token IMPERATIVE

%start <ProgramTypes.programChain> prog

%%

prog:
	| p = programChain; EOF { p }
	;

programChain:
	| EOF { EmptyProgram }
	| LETRECINTERP; e = letrec_expression; p = programChain { ProgramChain(Letrec(e), p) }
	| IMPLICIT; e = implicit_expression; p = programChain { ProgramChain(Implicit(e), p) }
	| IMPERATIVE; e = imperative_expression; p = programChain { ProgramChain(Imperative(e), p) }
	;

implicit_expression:
	| i =  INT { Implicit_refs.Const_exp(i) }
	| x = ID { Implicit_refs.Var_exp(x) }
	| e1 = implicit_expression; DIFF; e2 = implicit_expression { Implicit_refs.Diff_exp(e1, e2) }
	| SET; x = ID; EQUALS; e = implicit_expression { Implicit_refs.Assign_exp(x,e) }
	| LET; x = ID; EQUALS; e1 = implicit_expression; IN; e2 = implicit_expression { Implicit_refs.Let_exp(x, e1, e2)}
	| LETREC; x = ID; LPAREN; bound = ID; RPAREN; EQUALS; proc = implicit_expression; IN; letrec_body = implicit_expression { Implicit_refs.Letrec_exp(x, bound, proc, letrec_body)}
	| BEGIN; exp_list = separated_list(SEMICOLON, implicit_expression); END { Implicit_refs.Begin_exp(exp_list) }
	| LPAREN; e = implicit_expression; RPAREN { e }
	| LPAREN; e1 = implicit_expression; e2 = implicit_expression; RPAREN { Implicit_refs.Call_exp(e1, e2) }
	| ZERO; e = implicit_expression { Implicit_refs.Zero_exp(e)}
	| IF; e1 = implicit_expression; THEN; e2 = implicit_expression; ELSE; e3 = implicit_expression { Implicit_refs.If_exp(e1, e2, e3)}
	| PROC; x = ID; e = implicit_expression; { Implicit_refs.Proc_exp(x, e) }
	;

letrec_expression:
	| i =  INT { LETREC.Const_exp(i) }
	| x = ID { LETREC.Var_exp(x) }
	| e1 = letrec_expression; DIFF; e2 = letrec_expression { LETREC.Diff_exp(e1, e2) }
	| LET; x = ID; EQUALS; e1 = letrec_expression; IN; e2 = letrec_expression { LETREC.Let_exp(x, e1, e2)}
	| LETREC; x = ID; LPAREN; bound = ID; RPAREN; EQUALS; proc = letrec_expression; IN; letrec_body = letrec_expression { LETREC.Letrec_exp(x, bound, proc, letrec_body)}
	| BEGIN; exp_list = separated_list(SEMICOLON, letrec_expression); END { LETREC.Begin_exp(exp_list) }
	| LPAREN; e = letrec_expression; RPAREN { e }
	| LPAREN; e1 = letrec_expression; e2 = letrec_expression; RPAREN { LETREC.Call_exp(e1, e2) }
	| ZERO; e = letrec_expression { LETREC.Zero_exp(e)}
	| IF; e1 = letrec_expression; THEN; e2 = letrec_expression; ELSE; e3 = letrec_expression { LETREC.If_exp(e1, e2, e3)}
	| PROC; x = ID; e = letrec_expression; { LETREC.Proc_exp(x, e) }
	;

imperative_expression:
	| i =  INT { Imperative.Const_exp(i) }
	| x = ID { Imperative.Var_exp(x) }
	| e1 = imperative_expression; DIFF; e2 = imperative_expression { Imperative.Diff_exp(e1, e2) }
	| LET; x = ID; EQUALS; e1 = imperative_expression; IN; e2 = imperative_expression { Imperative.Let_exp(x, e1, e2)}
	| LETREC; x = ID; LPAREN; bound = ID; RPAREN; EQUALS; proc = imperative_expression; IN; letrec_body = imperative_expression { Imperative.Letrec_exp(x, bound, proc, letrec_body)}
	| LPAREN; e = imperative_expression; RPAREN { e }
	| LPAREN; e1 = imperative_expression; e2 = imperative_expression; RPAREN { Imperative.Call_exp(e1, e2) }
	| ZERO; e = imperative_expression { Imperative.Zero_exp(e)}
	| IF; e1 = imperative_expression; THEN; e2 = imperative_expression; ELSE; e3 = imperative_expression { Imperative.If_exp(e1, e2, e3)}
	| PROC; x = ID; e = imperative_expression; { Imperative.Proc_exp(x, e) }
	;