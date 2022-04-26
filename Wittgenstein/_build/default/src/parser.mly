%{
	open Wittgenstein
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
%token END
%token SEMICOLON
%token PUBLIC
%token PRIVATE
%token ENDLANG
%token WORD
%token MEANING
%token SPEAK
%token OUTSIDE
%token EMPTY

%start <Wittgenstein.world> prog

%%

prog:
	| w = world; EOF { w }
	;

world:
	| PUBLIC; pub_lang = language; PRIVATE; priv_lang = language; OUTSIDE; 
		sensations = separated_list(SEMICOLON, INT); SPEAK; words = separated_list(SEMICOLON, ID) { World(pub_lang, priv_lang, (Empty_exp), sensations, words) }
	;

language:
	| ENDLANG { EndOfLang }
	| WORD; x = ID; MEANING; i = INT; rest = language { Assign_exp(x, (Sensation(i)), rest) }
	;

expression:
	| i =  INT { Const_exp(i) }
	| x = ID { Word_exp(x) }
	| e1 = expression; DIFF; e2 = expression { Diff_exp(e1, e2) }
	| LET; x = ID; EQUALS; e1 = expression; IN; e2 = expression { Let_exp(x, e1, e2)}
	| LPAREN; e = expression; RPAREN { e }
	| LPAREN; e1 = expression; e2 = expression; RPAREN { Call_exp(e1, e2) }
	| ZERO; e = expression { Zero_exp(e)}
	| IF; e1 = expression; THEN; e2 = expression; ELSE; e3 = expression { If_exp(e1, e2, e3)}
	| PROC; x = ID; e = expression; { Proc_exp(x, e) }
	| EMPTY {Empty_exp}
	;