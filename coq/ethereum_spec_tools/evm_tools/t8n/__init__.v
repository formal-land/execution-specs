(* Generated *)
(*
Create a transition tool for the given fork.
*)


Definition t8n_arguments (subparsers : (* TODO type *)) : M unit :=
  (*
      Adds the arguments for the t8n tool subparser.
      *)
  do* M.assign "t8n_parser" [[
    M.get_field ~(| subparsers, "add_parser" |) ~(|
      (* TODO constant *)
    |) in
  ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "t8n_parser" |), "add_argument" |) ~(|
    (* TODO constant *)
  |) ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "t8n_parser" |), "add_argument" |) ~(|
    (* TODO constant *)
  |) ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "t8n_parser" |), "add_argument" |) ~(|
    (* TODO constant *)
  |) ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "t8n_parser" |), "add_argument" |) ~(|
    (* TODO constant *)
  |) ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "t8n_parser" |), "add_argument" |) ~(|
    (* TODO constant *)
  |) ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "t8n_parser" |), "add_argument" |) ~(|
    (* TODO constant *)
  |) ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "t8n_parser" |), "add_argument" |) ~(|
    (* TODO constant *)
  |) ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "t8n_parser" |), "add_argument" |) ~(|
    (* TODO constant *)
  |) ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "t8n_parser" |), "add_argument" |) ~(|
    (* TODO constant *)
  |) ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "t8n_parser" |), "add_argument" |) ~(|
    (* TODO constant *)
  |) ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "t8n_parser" |), "add_argument" |) ~(|
    (* TODO constant *)
  |) ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "t8n_parser" |), "add_argument" |) ~(|
    (* TODO constant *)
  |) ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "t8n_parser" |), "add_argument" |) ~(|
    (* TODO constant *)
  |) ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "t8n_parser" |), "add_argument" |) ~(|
    (* TODO constant *)
  |) ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "t8n_parser" |), "add_argument" |) ~(|
    (* TODO constant *)
  |) ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "t8n_parser" |), "add_argument" |) ~(|
    (* TODO constant *)
  |) ]] in
  M.pure tt.
