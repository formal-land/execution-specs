(* Generated *)
(*
Ethereum Virtual Machine (EVM) IDENTITY PRECOMPILED CONTRACT
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Implementation of the `IDENTITY` precompiled contract.
*)

Require ethereum_types.numeric.
Require ethereum.utils.numeric.
Require ethereum.homestead.vm.
Require ethereum.homestead.vm.gas.

Definition identity (evm : Evm) : M unit :=
  (*
      Writes the message data to output.

      Parameters
      ----------
      evm :
          The current EVM frame.
      *)
  do* M.assign "data" [[
    M.get_field ~(| M.get_field ~(| evm, "message" |), "data" |) in
  ]] in
  do* M.assign "word_count" [[
    (* TODO expression *) in
  ]] in
  do* [[ vm.gas.charge_gas ~(|
    evm,
    (* TODO expression *)
  |) ]] in
  (* TODO assignment *)
  M.pure tt.
