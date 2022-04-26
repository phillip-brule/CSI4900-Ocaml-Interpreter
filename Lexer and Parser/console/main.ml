open Interp
open Printf
open Main

(* ----Prompts---- *)
let initial_prompt () = printf "Would you like to write a program here or use a file? (W - for write, F - for file) \n> %!"
let write_prompt () = printf "Type in the program you would like to evaluate below: \n %!"

let write_program () = 
	write_prompt ();
	let program = read_line () in
		print_string (interp program)

let file () = printf "Type in file name below: \n";
	let program = ref "" in 
		let channel = open_in (read_line ()) in
	try
		while true; do 
			program := String.concat !program [""; (input_line channel)]
		done
	with End_of_file -> 
		close_in channel;
		print_string (interp (!program))


let rec init () = 
	initial_prompt ();
	let write_or_file = read_line () in 
		match write_or_file with
		| "W" -> write_program ()
		| "F" -> file ()
		| _ -> printf "Sorry invalid response.\n"; init ()



let () = init ()