(* Generated *)
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
Require ethereum.tangerine_whistle.blocks.
Require ethereum.tangerine_whistle.fork_types.
Require ethereum.tangerine_whistle.state.

Definition incorporate_child_on_success (evm : Evm) (child_evm : Evm) : M unit :=
  (*
      Incorporate the state of a successful `child_evm` into the parent `evm`.

      Parameters
      ----------
      evm :
          The parent `EVM`.
      child_evm :
          The child evm to incorporate.
      *)
  do* M.aug_assign [[ M.get_field ~(| evm, "gas_left" |) ]] [[
    M.get_field ~(| child_evm, "gas_left" |)
  ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "logs" |) ]] [[
    M.get_field ~(| child_evm, "logs" |)
  ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "refund_counter" |) ]] [[
    M.get_field ~(| child_evm, "refund_counter" |)
  ]] in
  do* [[ M.get_field ~(| M.get_field ~(| evm, "accounts_to_delete" |), "update" |) ~(|
    M.get_field ~(| child_evm, "accounts_to_delete" |)
  |) ]] in
  M.pure tt.

Definition incorporate_child_on_error (evm : Evm) (child_evm : Evm) : M unit :=
  (*
      Incorporate the state of an unsuccessful `child_evm` into the parent `evm`.

      Parameters
      ----------
      evm :
          The parent `EVM`.
      child_evm :
          The child evm to incorporate.
      *)
  do* M.aug_assign [[ M.get_field ~(| evm, "gas_left" |) ]] [[
    M.get_field ~(| child_evm, "gas_left" |)
  ]] in
  M.pure tt.
