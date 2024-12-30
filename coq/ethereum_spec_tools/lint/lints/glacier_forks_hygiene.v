(* Generated *)
(*
Glacier Fork Hygiene Lint
^^^^^^^^^^^^^^^^^^^^^^^^^
Ensures that the glacier forks have changes only in BOMB_DELAY_BLOCKS.
*)


Definition add_diagnostic (diagnostics : (* TODO type *)) (message : str) : M unit :=
  (*
      Adds a new diagnostic message.
      *)
  do* M.assign "diagnostic" [[
    M.get_local ~(| "Diagnostic" |) ~(|

    |) in
  ]] in
  do* [[ M.get_field ~(| diagnostics, "append" |) ~(|
    M.get_local ~(| "diagnostic" |)
  |) ]] in
  M.pure tt.
