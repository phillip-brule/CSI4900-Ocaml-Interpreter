%{
	open PROC_Implementation
%}


%token <int> INT
%token DIFF
%token LPAREN
%token RPAREN
%token EOF

%start <PROC_Implementation.expression> prog

%%

prog:
	| e = expression; EOF { (e) }
	;

expression:
	| i =  INT { Const_exp(i) }
	| e1 = expression; DIFF; e2 = expression { Diff_exp(e1,e2) }
	| LPAREN; e = expression; RPAREN { e }
	;