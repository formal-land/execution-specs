(* Generated *)
(*
Ethereum Virtual Machine (EVM) Blake2 PRECOMPILED CONTRACT
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Implementation of the `Blake2` precompiled contract.
*)

Require ethereum.crypto.blake2.
Require ethereum.istanbul.vm.
Require ethereum.istanbul.vm.gas.
Require ethereum.istanbul.vm.exceptions.

Definition blake2f (evm : Evm) : M unit :=
  (*
      Writes the Blake2 hash to output.

      Parameters
      ----------
      evm :
          The current EVM frame.
      *)
  do* M.assign "data" [[
    M.get_field ~(| M.get_field ~(| evm, "message" |), "data" |) in
  ]] in
  (* TODO statement *)
  do* M.assign "blake2b" [[
    ethereum.crypto.blake2.Blake2b ~(|

    |) in
  ]] in
  (* TODO assignment *)
  do* [[ vm.gas.charge_gas ~(|
    evm,
    (* TODO expression *)
  |) ]] in
  (* TODO statement *)
  (* TODO assignment *)
  M.pure tt.
