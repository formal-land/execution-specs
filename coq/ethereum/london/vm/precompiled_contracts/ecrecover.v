(*
Ethereum Virtual Machine (EVM) ECRECOVER PRECOMPILED CONTRACT
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Implementation of the ECRECOVER precompiled contract.
*)

Require ethereum_types.numeric.
Require ethereum.crypto.elliptic_curve.
Require ethereum.crypto.hash.
Require ethereum.utils.byte.
Require london.vm.
Require london.vm.gas.
Require london.vm.memory.

Definition ecrecover : M unit :=
  (*
      Decrypts the address using elliptic curve DSA recovery mechanism and writes
      the address to output.

      Parameters
      ----------
      evm :
          The current EVM frame.
      *)
  let* data := evm.["message"].["data"] in
  do* vm.gas.charge_gas (|
    evm,
    vm.gas.GAS_ECRECOVER
  |) in
  let* message_hash_bytes := vm.memory.buffer_read (|
    data,
    ethereum_types.numeric.U256 (|
      (* TODO expression *)
    |),
    ethereum_types.numeric.U256 (|
      (* TODO expression *)
    |)
  |) in
  let* message_hash := ethereum.crypto.hash.Hash32 (|
    message_hash_bytes
  |) in
  let* v := ethereum_types.numeric.U256.["from_be_bytes"] (|
    vm.memory.buffer_read (|
      data,
      ethereum_types.numeric.U256 (|
        (* TODO expression *)
      |),
      ethereum_types.numeric.U256 (|
        (* TODO expression *)
      |)
    |)
  |) in
  let* r := ethereum_types.numeric.U256.["from_be_bytes"] (|
    vm.memory.buffer_read (|
      data,
      ethereum_types.numeric.U256 (|
        (* TODO expression *)
      |),
      ethereum_types.numeric.U256 (|
        (* TODO expression *)
      |)
    |)
  |) in
  let* s := ethereum_types.numeric.U256.["from_be_bytes"] (|
    vm.memory.buffer_read (|
      data,
      ethereum_types.numeric.U256 (|
        (* TODO expression *)
      |),
      ethereum_types.numeric.U256 (|
        (* TODO expression *)
      |)
    |)
  |) in
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  let* address := (* TODO expression *) in
  let* padded_address := ethereum.utils.byte.left_pad_zero_bytes (|
    address,
    (* TODO expression *)
  |) in
  (* TODO assignment *)

