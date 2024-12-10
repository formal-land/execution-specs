(*
Ethereum Virtual Machine (EVM)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

The abstract computer which runs the code stored in an
`.fork_types.Account`.
*)

Require dataclasses.
Require typing.
Require ethereum_types.bytes.
Require ethereum_types.numeric.
Require ethereum.crypto.hash.
Require spurious_dragon.blocks.
Require spurious_dragon.fork_types.
Require spurious_dragon.state.
Require spurious_dragon.vm.precompiled_contracts.

Definition incorporate_child_on_success : M unit :=
  (*
      Incorporate the state of a successful `child_evm` into the parent `evm`.

      Parameters
      ----------
      evm :
          The parent `EVM`.
      child_evm :
          The child evm to incorporate.
      *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  do* evm.["accounts_to_delete"].["update"] (|
    child_evm.["accounts_to_delete"]
  |) in
  do* evm.["touched_accounts"].["update"] (|
    child_evm.["touched_accounts"]
  |) in
  (* TODO statement *)


Definition incorporate_child_on_error : M unit :=
  (*
      Incorporate the state of an unsuccessful `child_evm` into the parent `evm`.

      Parameters
      ----------
      evm :
          The parent `EVM`.
      child_evm :
          The child evm to incorporate.
      *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)

