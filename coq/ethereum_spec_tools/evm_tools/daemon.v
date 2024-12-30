(* Generated *)
(*
Run ethereum-spec-evm as a daemon.
*)


Definition daemon_arguments (subparsers : (* TODO type *)) : M unit :=
  (*
      Adds the arguments for the daemon tool subparser.
      *)
  do* M.assign "parser" [[
    M.get_field ~(| subparsers, "add_parser" |) ~(|
      (* TODO constant *)
    |) in
  ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "parser" |), "add_argument" |) ~(|
    (* TODO constant *)
  |) ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "parser" |), "add_argument" |) ~(|
    (* TODO constant *)
  |) ]] in
  M.pure tt.
