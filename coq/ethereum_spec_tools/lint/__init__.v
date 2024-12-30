(* Generated *)
(*
Lints
^^^^^

Checks specific to the Ethereum specification source code.
*)


Definition compare_ast (old : (* TODO type *)) (new : (* TODO type *)) : M bool :=
  (*
      Check if two nodes are the equal.
      *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.

Definition walk_sources (fork : Hardfork) : M (* TODO type *) :=
  (*
      Import the modules specifying a hardfork, and retrieve their source code.
      *)
  (* TODO statement *)
  M.pure tt.

Definition main : M int :=
  (*
      `ethereum-spec-lint` checks for style and formatting issues specific to the
      Ethereum specification.
      *)
  do* M.assign "linter" [[
    M.get_local ~(| "Linter" |) ~(|

    |) in
  ]] in
  (* TODO statement *)
  M.pure tt.
