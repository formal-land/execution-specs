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
Require tangerine_whistle.blocks.
Require tangerine_whistle.fork_types.
Require tangerine_whistle.state.

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

