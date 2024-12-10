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
Require london.vm.
Require london.vm.gas.
Require london.vm.memory.
Require london.vm.exceptions.

Definition alt_bn128_add : M unit :=
  (*
      The ALT_BN128 addition precompiled contract.

      Parameters
      ----------
      evm :
          The current EVM frame.
      *)
  let* data := evm.["message"].["data"] in
  do* vm.gas.charge_gas (|
    evm,
    ethereum_types.numeric.Uint (|
      (* TODO expression *)
    |)
  |) in
  let* x0_bytes := vm.memory.buffer_read (|
    data,
    ethereum_types.numeric.U256 (|
      (* TODO expression *)
    |),
    ethereum_types.numeric.U256 (|
      (* TODO expression *)
    |)
  |) in
  let* x0_value := int (|
    ethereum_types.numeric.U256.["from_be_bytes"] (|
      x0_bytes
    |)
  |) in
  let* y0_bytes := vm.memory.buffer_read (|
    data,
    ethereum_types.numeric.U256 (|
      (* TODO expression *)
    |),
    ethereum_types.numeric.U256 (|
      (* TODO expression *)
    |)
  |) in
  let* y0_value := int (|
    ethereum_types.numeric.U256.["from_be_bytes"] (|
      y0_bytes
    |)
  |) in
  let* x1_bytes := vm.memory.buffer_read (|
    data,
    ethereum_types.numeric.U256 (|
      (* TODO expression *)
    |),
    ethereum_types.numeric.U256 (|
      (* TODO expression *)
    |)
  |) in
  let* x1_value := int (|
    ethereum_types.numeric.U256.["from_be_bytes"] (|
      x1_bytes
    |)
  |) in
  let* y1_bytes := vm.memory.buffer_read (|
    data,
    ethereum_types.numeric.U256 (|
      (* TODO expression *)
    |),
    ethereum_types.numeric.U256 (|
      (* TODO expression *)
    |)
  |) in
  let* y1_value := int (|
    ethereum_types.numeric.U256.["from_be_bytes"] (|
      y1_bytes
    |)
  |) in
  (* TODO statement *)
  (* TODO statement *)
  let* p := (* TODO expression *) in
  (* TODO assignment *)


Definition alt_bn128_mul : M unit :=
  (*
      The ALT_BN128 multiplication precompiled contract.

      Parameters
      ----------
      evm :
          The current EVM frame.
      *)
  let* data := evm.["message"].["data"] in
  do* vm.gas.charge_gas (|
    evm,
    ethereum_types.numeric.Uint (|
      (* TODO expression *)
    |)
  |) in
  let* x0_bytes := vm.memory.buffer_read (|
    data,
    ethereum_types.numeric.U256 (|
      (* TODO expression *)
    |),
    ethereum_types.numeric.U256 (|
      (* TODO expression *)
    |)
  |) in
  let* x0_value := int (|
    ethereum_types.numeric.U256.["from_be_bytes"] (|
      x0_bytes
    |)
  |) in
  let* y0_bytes := vm.memory.buffer_read (|
    data,
    ethereum_types.numeric.U256 (|
      (* TODO expression *)
    |),
    ethereum_types.numeric.U256 (|
      (* TODO expression *)
    |)
  |) in
  let* y0_value := int (|
    ethereum_types.numeric.U256.["from_be_bytes"] (|
      y0_bytes
    |)
  |) in
  let* n := int (|
    ethereum_types.numeric.U256.["from_be_bytes"] (|
      vm.memory.buffer_read (|
        data,
        ethereum_types.numeric.U256 (|
          (* TODO expression *)
        |),
        ethereum_types.numeric.U256 (|
          (* TODO expression *)
        |)
      |)
    |)
  |) in
  (* TODO statement *)
  (* TODO statement *)
  let* p := p0.["mul_by"] (|
    n
  |) in
  (* TODO assignment *)


Definition alt_bn128_pairing_check : M unit :=
  (*
      The ALT_BN128 pairing check precompiled contract.

      Parameters
      ----------
      evm :
          The current EVM frame.
      *)
  let* data := evm.["message"].["data"] in
  do* vm.gas.charge_gas (|
    evm,
    ethereum_types.numeric.Uint (|
      (* TODO expression *)
    |)
  |) in
  (* TODO statement *)
  let* result := ethereum.crypto.alt_bn128.BNF12.["from_int"] (|
    (* TODO expression *)
  |) in
  (* TODO statement *)
  (* TODO statement *)

