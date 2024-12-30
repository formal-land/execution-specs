(* Generated *)
(*
Plugins for docc specific to the Ethereum execution specification.
*)


Definition pairwise (iterable : (* TODO type *)) : M (* TODO type *) :=
  (*
      ABCDEFG --> AB BC CD DE EF FG
      *)
  (* TODO assignment *)
  do* [[ M.get_local ~(| "next" |) ~(|
    M.get_local ~(| "b" |),
    tt
  |) ]] in
  (* TODO statement *)
  M.pure tt.

Definition render_diff (context : object) (parent : object) (diff : object) : M (* TODO type *) :=
  (*
      Render a DiffNode.
      *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  do* [[ M.get_field ~(| M.get_local ~(| "parent_" |), "append" |) ~(|
    M.get_local ~(| "tag" |)
  |) ]] in
  (* TODO statement *)
  M.pure tt.

Definition render_before_after (context : object) (parent : object) (node_ : object) : M (* TODO type *) :=
  (*
      Render a BeforeNode or an AfterNode.
      *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.
