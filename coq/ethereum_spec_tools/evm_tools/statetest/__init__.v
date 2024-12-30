(* Generated *)
(*
Execute state tests.
*)


Definition read_test_cases (test_file_path : str) : M (* TODO type *) :=
  (*
      Given a path to a filled state test in JSON format, return all the
      `TestCase`s it contains.
      *)
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.

Definition run_test_case (test_case : TestCase) (t8n_extra : (* TODO type *)) (output_basedir : (* TODO type *)) : M Result :=
  (*
      Runs a single general state test
      *)
  (* TODO statement *)
  do* M.assign "env" [[
    M.get_local ~(| "deepcopy" |) ~(|
      M.get_field ~(| test_case, "env" |)
    |) in
  ]] in
  (* TODO statement *)
  (* TODO assignment *)
  do* M.assign "alloc" [[
    M.get_local ~(| "deepcopy" |) ~(|
      M.get_field ~(| test_case, "pre" |)
    |) in
  ]] in
  do* M.assign "post" [[
    M.get_local ~(| "deepcopy" |) ~(|
      M.get_field ~(| test_case, "post" |)
    |) in
  ]] in
  do* M.assign "d" [[
    (* TODO expression *) in
  ]] in
  do* M.assign "g" [[
    (* TODO expression *) in
  ]] in
  do* M.assign "v" [[
    (* TODO expression *) in
  ]] in
  do* M.assign "tx" [[
    (* TODO expression *) in
  ]] in
  (* TODO statement *)
  do* M.assign "txs" [[
    (* TODO expression *) in
  ]] in
  do* M.assign "in_stream" [[
    M.get_local ~(| "StringIO" |) ~(|
      M.get_field ~(| M.get_local ~(| "json" |), "dumps" |) ~(|
        (* TODO expression *)
      |)
    |) in
  ]] in
  do* M.assign "out_stream" [[
    M.get_local ~(| "StringIO" |) ~(|

    |) in
  ]] in
  do* M.assign "t8n_args" [[
    (* TODO expression *) in
  ]] in
  (* TODO statement *)
  do* M.assign "parser" [[
    M.get_local ~(| "create_parser" |) ~(|

    |) in
  ]] in
  do* M.assign "t8n_options" [[
    M.get_field ~(| M.get_local ~(| "parser" |), "parse_args" |) ~(|
      M.get_local ~(| "t8n_args" |)
    |) in
  ]] in
  (* TODO statement *)
  do* M.assign "t8n" [[
    M.get_local ~(| "T8N" |) ~(|
      M.get_local ~(| "t8n_options" |),
      M.get_local ~(| "out_stream" |),
      M.get_local ~(| "in_stream" |)
    |) in
  ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "t8n" |), "apply_body" |) ~(|

  |) ]] in
  (* TODO statement *)
  M.pure tt.

Definition state_test_arguments (subparsers : (* TODO type *)) : M unit :=
  (*
      Adds the arguments for the statetest tool subparser.
      *)
  do* M.assign "statetest_parser" [[
    M.get_field ~(| subparsers, "add_parser" |) ~(|
      (* TODO constant *)
    |) in
  ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "statetest_parser" |), "add_argument" |) ~(|
    (* TODO constant *)
  |) ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "statetest_parser" |), "add_argument" |) ~(|
    (* TODO constant *)
  |) ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "statetest_parser" |), "add_argument" |) ~(|
    (* TODO constant *)
  |) ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "statetest_parser" |), "add_argument" |) ~(|
    (* TODO constant *)
  |) ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "statetest_parser" |), "add_argument" |) ~(|
    (* TODO constant *)
  |) ]] in
  M.pure tt.
