(* Generated *)
(*
Simple patching tool
*)


Definition main : M unit :=
  (*
      Patch the changes from one fork into the others.
      *)
  do* M.assign "options" [[
    M.get_field ~(| M.get_local ~(| "parser" |), "parse_args" |) ~(|

    |) in
  ]] in
  (* TODO statement *)
  do* M.assign "source_fork_path" [[
    (* TODO expression *) in
  ]] in
  (* TODO statement *)
  do* M.assign "git_diff" [[
    M.get_field ~(| M.get_local ~(| "subprocess" |), "run" |) ~(|
      (* TODO expression *)
    |) in
  ]] in
  do* M.assign "output_lines" [[
    M.get_field ~(| M.get_field ~(| M.get_local ~(| "git_diff" |), "stdout" |), "splitlines" |) ~(|

    |) in
  ]] in
  (* TODO statement *)
  M.pure tt.
