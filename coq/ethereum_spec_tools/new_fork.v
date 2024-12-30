(* Generated *)
(*
Tool to create a new fork using the latest fork
*)


Definition find_replace (dir : str) (find : str) (replace : str) (file_pattern : str) : M unit :=
  (*
      Replace the occurrence of a certain text in files with a new text
      *)
  (* TODO statement *)
  M.pure tt.

Definition main : M unit :=
  (*
      Create the new fork
      *)
  do* M.assign "options" [[
    M.get_field ~(| M.get_local ~(| "parser" |), "parse_args" |) ~(|

    |) in
  ]] in
  do* M.assign "from_fork" [[
    M.get_field ~(| M.get_local ~(| "options" |), "from_fork" |) in
  ]] in
  do* M.assign "to_fork" [[
    M.get_field ~(| M.get_local ~(| "options" |), "to_fork" |) in
  ]] in
  do* M.assign "from_test" [[
    (* TODO expression *) in
  ]] in
  do* M.assign "to_test" [[
    (* TODO expression *) in
  ]] in
  do* M.assign "fork_creator" [[
    M.get_local ~(| "ForkCreator" |) ~(|
      M.get_local ~(| "from_fork" |),
      M.get_local ~(| "to_fork" |),
      M.get_local ~(| "from_test" |),
      M.get_local ~(| "to_test" |)
    |) in
  ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "fork_creator" |), "duplicate_fork" |) ~(|

  |) ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "fork_creator" |), "update_new_fork_contents" |) ~(|

  |) ]] in
  do* M.assign "final_help_text" [[
    M.get_field ~(| (* TODO constant *), "format" |) ~(|

    |) in
  ]] in
  do* [[ M.get_local ~(| "print" |) ~(|
    M.get_local ~(| "final_help_text" |)
  |) ]] in
  M.pure tt.
