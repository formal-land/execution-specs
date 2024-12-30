(* Generated *)
(*
Create a block builder tool for the given fork.
*)


Definition b11r_arguments (subparsers : (* TODO type *)) : M unit :=
  (*
      Adds the arguments for the b11r tool subparser.
      *)
  do* M.assign "b11r_parser" [[
    M.get_field ~(| subparsers, "add_parser" |) ~(|
      (* TODO constant *)
    |) in
  ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "b11r_parser" |), "add_argument" |) ~(|
    (* TODO constant *)
  |) ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "b11r_parser" |), "add_argument" |) ~(|
    (* TODO constant *)
  |) ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "b11r_parser" |), "add_argument" |) ~(|
    (* TODO constant *)
  |) ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "b11r_parser" |), "add_argument" |) ~(|
    (* TODO constant *)
  |) ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "b11r_parser" |), "add_argument" |) ~(|
    (* TODO constant *)
  |) ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "b11r_parser" |), "add_argument" |) ~(|
    (* TODO constant *)
  |) ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "b11r_parser" |), "add_argument" |) ~(|
    (* TODO constant *)
  |) ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "b11r_parser" |), "add_argument" |) ~(|
    (* TODO constant *)
  |) ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "b11r_parser" |), "add_argument" |) ~(|
    (* TODO constant *)
  |) ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "b11r_parser" |), "add_argument" |) ~(|
    (* TODO constant *)
  |) ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "b11r_parser" |), "add_argument" |) ~(|
    (* TODO constant *)
  |) ]] in
  M.pure tt.
