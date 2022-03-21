open OUnit2
open Interp
(* open PROC_Implementation *)
open Main

(* n = test name, i = expected output, s = uninterpreted value *)
let make_i n i s =
n >:: (fun _ -> assert_equal (string_of_int i) (interp s))

let tests = [
	make_i "int" 22 "22";
	make_i "subtract" 10 "20 - 10";
	make_i "let" 22 "let x=22 in x";
	make_i "if" 22 "if zero? 0 then 22 else 12";
	make_i "full procedure program" (-100) "let x = 200 in let f = proc z (z - x) in let x = 100 in let g = proc z (z - x) in (f 1) - (g 1)";
	make_i "letrec example from pg 82 & figure 3.10" (12) "letrec double(x) = if zero? x then 0 else ((double (x - 1)) - (-2)) in (double 6)";
	]

let _ = run_test_tt_main ("suite" >::: tests)
(* let _ = print_string (interp "let x = 200 in let f = proc z (z - x) in let x = 100 in let g = proc z (z - x) in (f 1) - (g 1)") *)