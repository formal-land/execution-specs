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
Require cancun.vm.
Require cancun.vm.exceptions.
Require cancun.vm.gas.

Definition point_evaluation : M unit :=
  (*
      A pre-compile that verifies a KZG proof which claims that a blob
      (represented by a commitment) evaluates to a given value at a given point.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  let* data := evm.["message"].["data"] in
  (* TODO statement *)
  let* versioned_hash := (* TODO expression *) in
  let* z := ethereum_types.bytes.Bytes32 (|
    (* TODO expression *)
  |) in
  let* y := ethereum_types.bytes.Bytes32 (|
    (* TODO expression *)
  |) in
  let* commitment := ethereum.crypto.kzg.KZGCommitment (|
    (* TODO expression *)
  |) in
  let* proof := ethereum_types.bytes.Bytes48 (|
    (* TODO expression *)
  |) in
  do* vm.gas.charge_gas (|
    evm,
    vm.gas.GAS_POINT_EVALUATION
  |) in
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO assignment *)

