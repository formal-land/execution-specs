(*
Ethereum Virtual Machine (EVM) MODEXP PRECOMPILED CONTRACT
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Implementation of the `MODEXP` precompiled contract.
*)

Require ethereum_types.bytes.
Require ethereum_types.numeric.
Require paris.vm.
Require paris.vm.gas.
Require paris.vm.memory.

Definition modexp : M unit :=
  (*
      Calculates `(base**exp) % modulus` for arbitrary sized `base`, `exp` and.
      `modulus`. The return value is the same length as the modulus.
      *)
  let* data := evm.["message"].["data"] in
  let* base_length := ethereum_types.numeric.U256.["from_be_bytes"] (|
    memory.buffer_read (|
      data,
      ethereum_types.numeric.U256 (|
        (* TODO expression *)
      |),
      ethereum_types.numeric.U256 (|
        (* TODO expression *)
      |)
    |)
  |) in
  let* exp_length := ethereum_types.numeric.U256.["from_be_bytes"] (|
    memory.buffer_read (|
      data,
      ethereum_types.numeric.U256 (|
        (* TODO expression *)
      |),
      ethereum_types.numeric.U256 (|
        (* TODO expression *)
      |)
    |)
  |) in
  let* modulus_length := ethereum_types.numeric.U256.["from_be_bytes"] (|
    memory.buffer_read (|
      data,
      ethereum_types.numeric.U256 (|
        (* TODO expression *)
      |),
      ethereum_types.numeric.U256 (|
        (* TODO expression *)
      |)
    |)
  |) in
  let* exp_start := (* TODO expression *) in
  let* exp_head := ethereum_types.numeric.Uint.["from_be_bytes"] (|
    memory.buffer_read (|
      data,
      exp_start,
      min (|
        ethereum_types.numeric.U256 (|
          (* TODO expression *)
        |),
        exp_length
      |)
    |)
  |) in
  do* vm.gas.charge_gas (|
    evm,
    gas_cost (|
      base_length,
      modulus_length,
      exp_length,
      exp_head
    |)
  |) in
  (* TODO statement *)
  let* base := ethereum_types.numeric.Uint.["from_be_bytes"] (|
    memory.buffer_read (|
      data,
      ethereum_types.numeric.U256 (|
        (* TODO expression *)
      |),
      base_length
    |)
  |) in
  let* exp := ethereum_types.numeric.Uint.["from_be_bytes"] (|
    memory.buffer_read (|
      data,
      exp_start,
      exp_length
    |)
  |) in
  let* modulus_start := (* TODO expression *) in
  let* modulus := ethereum_types.numeric.Uint.["from_be_bytes"] (|
    memory.buffer_read (|
      data,
      modulus_start,
      modulus_length
    |)
  |) in
  (* TODO statement *)


Definition complexity : M unit :=
  (*
      Estimate the complexity of performing a modular exponentiation.

      Parameters
      ----------

      base_length :
          Length of the array representing the base integer.

      modulus_length :
          Length of the array representing the modulus integer.

      Returns
      -------

      complexity : `Uint`
          Complexity of performing the operation.
      *)
  let* max_length := max (|
    ethereum_types.numeric.Uint (|
      base_length
    |),
    ethereum_types.numeric.Uint (|
      modulus_length
    |)
  |) in
  let* words := (* TODO expression *) in
  (* TODO statement *)


Definition iterations : M unit :=
  (*
      Calculate the number of iterations required to perform a modular
      exponentiation.

      Parameters
      ----------

      exponent_length :
          Length of the array representing the exponent integer.

      exponent_head :
          First 32 bytes of the exponent (with leading zero padding if it is
          shorter than 32 bytes), as an unsigned integer.

      Returns
      -------

      iterations : `Uint`
          Number of iterations.
      *)
  (* TODO statement *)
  (* TODO statement *)


Definition gas_cost : M unit :=
  (*
      Calculate the gas cost of performing a modular exponentiation.

      Parameters
      ----------

      base_length :
          Length of the array representing the base integer.

      modulus_length :
          Length of the array representing the modulus integer.

      exponent_length :
          Length of the array representing the exponent integer.

      exponent_head :
          First 32 bytes of the exponent (with leading zero padding if it is
          shorter than 32 bytes), as an unsigned integer.

      Returns
      -------

      gas_cost : `Uint`
          Gas required for performing the operation.
      *)
  let* multiplication_complexity := complexity (|
    base_length,
    modulus_length
  |) in
  let* iteration_count := iterations (|
    exponent_length,
    exponent_head
  |) in
  let* cost := (* TODO expression *) in
  (* TODO statement *)
  (* TODO statement *)

