open Interp
(* open PROC_Implementation *)
open Main

(* ----Prompts---- *)




let init () =
	let program = ref "" in 
		let channel = open_in "Ocaml_Interpreter/test" in
	try
		while true; do 
			program := String.concat !program [""; (input_line channel)]
		done
	with End_of_file -> 
		close_in channel;
		let out_channel = open_out "Ocaml_Interpreter/output.txt" in
		output_string out_channel (interp (!program));
		close_out out_channel



let () = init ()