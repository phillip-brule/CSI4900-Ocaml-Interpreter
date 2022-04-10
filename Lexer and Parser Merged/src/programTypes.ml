type program = Letrec of LETREC.expression | Implicit of Implicit_refs.expression | Imperative of Imperative.expression

type programChain = ProgramChain of program * programChain | EmptyProgram