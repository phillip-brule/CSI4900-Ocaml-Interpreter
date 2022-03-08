%token <int> Const_exp
%token EOF

%start <PROC_Implementation.expression> prog

%%

prog:
	| e = expression; EOF { (e) }
	;

expression:
	| i =  Const_exp { Const_exp i }
	;