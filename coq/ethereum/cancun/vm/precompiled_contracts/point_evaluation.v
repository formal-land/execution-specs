(* Generated *)
(*
Ethereum Virtual Machine (EVM) POINT EVALUATION PRECOMPILED CONTRACT
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Implementation of the POINT EVALUATION precompiled contract.
*)

Require ethereum_types.bytes.
Require ethereum_types.numeric.
Require ethereum.crypto.kzg.
Require ethereum.cancun.vm.
Require ethereum.cancun.vm.exceptions.
Require ethereum.cancun.vm.gas.

Definition point_evaluation (evm : Evm) : M unit :=
  (*
      A pre-compile that verifies a KZG proof which claims that a blob
      (represented by a commitment) evaluates to a given value at a given point.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  do* M.assign "data" [[
    M.get_field ~(| M.get_field ~(| evm, "message" |), "data" |) in
  ]] in
  (* TODO statement *)
  do* M.assign "versioned_hash" [[
    (* TODO expression *) in
  ]] in
  do* M.assign "z" [[
    ethereum_types.bytes.Bytes32 ~(|
      (* TODO expression *)
    |) in
  ]] in
  do* M.assign "y" [[
    ethereum_types.bytes.Bytes32 ~(|
      (* TODO expression *)
    |) in
  ]] in
  do* M.assign "commitment" [[
    ethereum.crypto.kzg.KZGCommitment ~(|
      (* TODO expression *)
    |) in
  ]] in
  do* M.assign "proof" [[
    ethereum_types.bytes.Bytes48 ~(|
      (* TODO expression *)
    |) in
  ]] in
  do* [[ vm.gas.charge_gas ~(|
    evm,
    vm.gas.GAS_POINT_EVALUATION
  |) ]] in
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO assignment *)
  M.pure tt.
