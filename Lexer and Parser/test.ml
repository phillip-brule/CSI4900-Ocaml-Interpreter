open OUnit2
open PROC_Implementation
open Main

let make_i n i s =
n >:: (fun _ -> assert_equal (string_of_int i) (interp s))

let tests = [
	make_i "int" 22 "22";
	]

let _ = run_test_tt_main ("suite" >::: tests)