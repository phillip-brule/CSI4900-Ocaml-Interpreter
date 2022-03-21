open Interp
(* open PROC_Implementation *)
open Printf
open Main

(* ----Prompts---- *)
let initial_prompt () = printf "Would you like to write a program here or use a file? (W - for write, F - for file) \n> %!"
let write_prompt () = printf "Type in the program you would like to evaluate below: \n %!"

let write_program () = 
	write_prompt ();
	Unix.sleep 10; (*give 10s to write input but doesnt let you type anyways*)
	let program = Scanf.scanf "%! %S" (fun x -> interp x) in 
		print_string program

let file () = printf "place holder";
	let program = ref "" in 
		let channel = open_in file in
	try
		while true; do 
			program := String.concat !program [""; (input_line channel)]
		done; !program
	with End_of_file ->
		close_in channel;
		print_string (interp !program)




let rec init () = 
	initial_prompt ();
	let write_or_file = Scanf.scanf "%s" (fun x -> x) in 
		match write_or_file with
		| "W" -> write_program ()
		| "F" -> file ()
		| _ -> printf "Sorry invalid response."; init ()



let _ = init ()