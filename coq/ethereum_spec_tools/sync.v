(* Generated *)
(*
Ethereum Sync
^^^^^^^^^^^^^

Using an RPC provider, fetch each block and validate it with the specification.
*)


Definition main : M unit :=
  (*
      Using an RPC provider, fetch each block and validate it.
      *)
  do* [[ M.get_field ~(| M.get_local ~(| "logging" |), "basicConfig" |) ~(|

  |) ]] in
  do* M.assign "sync" [[
    M.get_local ~(| "Sync" |) ~(|

    |) in
  ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "sync" |), "process_blocks" |) ~(|

  |) ]] in
  M.pure tt.
