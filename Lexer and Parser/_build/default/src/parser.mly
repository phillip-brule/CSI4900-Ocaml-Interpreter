%{
	open LETREC
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

%start <LETREC.expression> prog

%%

prog:
	| e = expression; EOF { e }
	;

expression:
	| i =  INT { Const_exp(i) }
	| x = ID { Var_exp(x) }
	| e1 = expression; DIFF; e2 = expression { Diff_exp(e1, e2) }
	| LET; x = ID; EQUALS; e1 = expression; IN; e2 = expression { Let_exp(x, e1, e2)}
	| LETREC; x = ID; LPAREN; bound = ID; RPAREN; EQUALS; proc = expression; IN; letrec_body = expression { Letrec_exp(x, bound, proc, letrec_body)}
	| BEGIN; exp_list = separated_list(SEMICOLON, expression); END { Begin_exp(exp_list) }
	| LPAREN; e = expression; RPAREN { e }
	| LPAREN; e1 = expression; e2 = expression; RPAREN { Call_exp(e1, e2) }
	| ZERO; e = expression { Zero_exp(e)}
	| IF; e1 = expression; THEN; e2 = expression; ELSE; e3 = expression { If_exp(e1, e2, e3)}
	| PROC; x = ID; e = expression; { Proc_exp(x, e) }
	;

