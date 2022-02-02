%var checks V is a valid symbol from the symbol list of a, b or c.
var(V):- valid_symbol(V).
valid_symbol(a).
valid_symbol(b).
valid_symbol(c).

%env checks if E is an environment, somewhat redundant as extend_env can just be used to check
env(E):- empty_env(E), !. %no need to continue search
env(E):- extend_env(E).

empty_env([]). %empty environment is just an empty list

extend_env(E):- empty_env(E), !.
extend_env([V,I|E]):- var(V), extend_env(E).

%if Var in env is the var we want we will recieve Val,
%Example use if we want X: apply_env([Variable, X|Rest_of_Environemnt], Variable)
apply_env([Var, Val|Saved_env],Var):- var(Var), extend_env(Saved_env). % should this keep searching or stop here with cut?
apply_env([_|Saved_env],Var):- apply_env(Saved_env,Var).

appply_env_with_errors(Env, Var):- empty_env(Env), nl, write('No binding found for '), write(Var), !.
appply_env_with_errors(Env, Var):- apply_env(Env, Var), !.
appply_env_with_errors(Env, Var):- nl, write('Invalid environment.').
