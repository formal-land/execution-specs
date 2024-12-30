(* Generated *)
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
Require ethereum.shanghai.vm.
Require ethereum.shanghai.vm.gas.
Require ethereum.shanghai.vm.memory.

Definition ecrecover (evm : Evm) : M unit :=
  (*
      Decrypts the address using elliptic curve DSA recovery mechanism and writes
      the address to output.

      Parameters
      ----------
      evm :
          The current EVM frame.
      *)
  do* M.assign "data" [[
    M.get_field ~(| M.get_field ~(| evm, "message" |), "data" |) in
  ]] in
  do* [[ vm.gas.charge_gas ~(|
    evm,
    vm.gas.GAS_ECRECOVER
  |) ]] in
  do* M.assign "message_hash_bytes" [[
    vm.memory.buffer_read ~(|
      M.get_local ~(| "data" |),
      ethereum_types.numeric.U256 ~(|
        0
      |),
      ethereum_types.numeric.U256 ~(|
        32
      |)
    |) in
  ]] in
  do* M.assign "message_hash" [[
    ethereum.crypto.hash.Hash32 ~(|
      M.get_local ~(| "message_hash_bytes" |)
    |) in
  ]] in
  do* M.assign "v" [[
    M.get_field ~(| ethereum_types.numeric.U256, "from_be_bytes" |) ~(|
      vm.memory.buffer_read ~(|
        M.get_local ~(| "data" |),
        ethereum_types.numeric.U256 ~(|
          32
        |),
        ethereum_types.numeric.U256 ~(|
          32
        |)
      |)
    |) in
  ]] in
  do* M.assign "r" [[
    M.get_field ~(| ethereum_types.numeric.U256, "from_be_bytes" |) ~(|
      vm.memory.buffer_read ~(|
        M.get_local ~(| "data" |),
        ethereum_types.numeric.U256 ~(|
          64
        |),
        ethereum_types.numeric.U256 ~(|
          32
        |)
      |)
    |) in
  ]] in
  do* M.assign "s" [[
    M.get_field ~(| ethereum_types.numeric.U256, "from_be_bytes" |) ~(|
      vm.memory.buffer_read ~(|
        M.get_local ~(| "data" |),
        ethereum_types.numeric.U256 ~(|
          96
        |),
        ethereum_types.numeric.U256 ~(|
          32
        |)
      |)
    |) in
  ]] in
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  do* M.assign "address" [[
    (* TODO expression *) in
  ]] in
  do* M.assign "padded_address" [[
    ethereum.utils.byte.left_pad_zero_bytes ~(|
      M.get_local ~(| "address" |),
      32
    |) in
  ]] in
  (* TODO assignment *)
  M.pure tt.
