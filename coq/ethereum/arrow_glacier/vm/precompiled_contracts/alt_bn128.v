(* Generated *)
(*
Ethereum Virtual Machine (EVM) ALT_BN128 CONTRACTS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Implementation of the ALT_BN128 precompiled contracts.
*)

Require ethereum_types.numeric.
Require ethereum.crypto.alt_bn128.
Require ethereum.arrow_glacier.vm.
Require ethereum.arrow_glacier.vm.gas.
Require ethereum.arrow_glacier.vm.memory.
Require ethereum.arrow_glacier.vm.exceptions.

Definition alt_bn128_add (evm : Evm) : M unit :=
  (*
      The ALT_BN128 addition precompiled contract.

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
    ethereum_types.numeric.Uint ~(|
      150
    |)
  |) ]] in
  do* M.assign "x0_bytes" [[
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
  do* M.assign "x0_value" [[
    M.get_local ~(| "int" |) ~(|
      M.get_field ~(| ethereum_types.numeric.U256, "from_be_bytes" |) ~(|
        M.get_local ~(| "x0_bytes" |)
      |)
    |) in
  ]] in
  do* M.assign "y0_bytes" [[
    vm.memory.buffer_read ~(|
      M.get_local ~(| "data" |),
      ethereum_types.numeric.U256 ~(|
        32
      |),
      ethereum_types.numeric.U256 ~(|
        32
      |)
    |) in
  ]] in
  do* M.assign "y0_value" [[
    M.get_local ~(| "int" |) ~(|
      M.get_field ~(| ethereum_types.numeric.U256, "from_be_bytes" |) ~(|
        M.get_local ~(| "y0_bytes" |)
      |)
    |) in
  ]] in
  do* M.assign "x1_bytes" [[
    vm.memory.buffer_read ~(|
      M.get_local ~(| "data" |),
      ethereum_types.numeric.U256 ~(|
        64
      |),
      ethereum_types.numeric.U256 ~(|
        32
      |)
    |) in
  ]] in
  do* M.assign "x1_value" [[
    M.get_local ~(| "int" |) ~(|
      M.get_field ~(| ethereum_types.numeric.U256, "from_be_bytes" |) ~(|
        M.get_local ~(| "x1_bytes" |)
      |)
    |) in
  ]] in
  do* M.assign "y1_bytes" [[
    vm.memory.buffer_read ~(|
      M.get_local ~(| "data" |),
      ethereum_types.numeric.U256 ~(|
        96
      |),
      ethereum_types.numeric.U256 ~(|
        32
      |)
    |) in
  ]] in
  do* M.assign "y1_value" [[
    M.get_local ~(| "int" |) ~(|
      M.get_field ~(| ethereum_types.numeric.U256, "from_be_bytes" |) ~(|
        M.get_local ~(| "y1_bytes" |)
      |)
    |) in
  ]] in
  (* TODO statement *)
  (* TODO statement *)
  do* M.assign "p" [[
    (* TODO expression *) in
  ]] in
  (* TODO assignment *)
  M.pure tt.

Definition alt_bn128_mul (evm : Evm) : M unit :=
  (*
      The ALT_BN128 multiplication precompiled contract.

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
    ethereum_types.numeric.Uint ~(|
      6000
    |)
  |) ]] in
  do* M.assign "x0_bytes" [[
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
  do* M.assign "x0_value" [[
    M.get_local ~(| "int" |) ~(|
      M.get_field ~(| ethereum_types.numeric.U256, "from_be_bytes" |) ~(|
        M.get_local ~(| "x0_bytes" |)
      |)
    |) in
  ]] in
  do* M.assign "y0_bytes" [[
    vm.memory.buffer_read ~(|
      M.get_local ~(| "data" |),
      ethereum_types.numeric.U256 ~(|
        32
      |),
      ethereum_types.numeric.U256 ~(|
        32
      |)
    |) in
  ]] in
  do* M.assign "y0_value" [[
    M.get_local ~(| "int" |) ~(|
      M.get_field ~(| ethereum_types.numeric.U256, "from_be_bytes" |) ~(|
        M.get_local ~(| "y0_bytes" |)
      |)
    |) in
  ]] in
  do* M.assign "n" [[
    M.get_local ~(| "int" |) ~(|
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
      |)
    |) in
  ]] in
  (* TODO statement *)
  (* TODO statement *)
  do* M.assign "p" [[
    M.get_field ~(| M.get_local ~(| "p0" |), "mul_by" |) ~(|
      M.get_local ~(| "n" |)
    |) in
  ]] in
  (* TODO assignment *)
  M.pure tt.

Definition alt_bn128_pairing_check (evm : Evm) : M unit :=
  (*
      The ALT_BN128 pairing check precompiled contract.

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
    ethereum_types.numeric.Uint ~(|
      (* TODO expression *)
    |)
  |) ]] in
  (* TODO statement *)
  do* M.assign "result" [[
    M.get_field ~(| ethereum.crypto.alt_bn128.BNF12, "from_int" |) ~(|
      1
    |) in
  ]] in
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.
