(* Generated *)
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
Require ethereum.constantinople.vm.
Require ethereum.constantinople.vm.gas.
Require ethereum.constantinople.vm.memory.

Definition modexp (evm : Evm) : M unit :=
  (*
      Calculates `(base**exp) % modulus` for arbitrary sized `base`, `exp` and.
      `modulus`. The return value is the same length as the modulus.
      *)
  do* M.assign "data" [[
    M.get_field ~(| M.get_field ~(| evm, "message" |), "data" |) in
  ]] in
  do* M.assign "base_length" [[
    M.get_field ~(| ethereum_types.numeric.U256, "from_be_bytes" |) ~(|
      memory.buffer_read ~(|
        M.get_local ~(| "data" |),
        ethereum_types.numeric.U256 ~(|
          0
        |),
        ethereum_types.numeric.U256 ~(|
          32
        |)
      |)
    |) in
  ]] in
  do* M.assign "exp_length" [[
    M.get_field ~(| ethereum_types.numeric.U256, "from_be_bytes" |) ~(|
      memory.buffer_read ~(|
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
  do* M.assign "modulus_length" [[
    M.get_field ~(| ethereum_types.numeric.U256, "from_be_bytes" |) ~(|
      memory.buffer_read ~(|
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
  do* M.assign "exp_start" [[
    (* TODO expression *) in
  ]] in
  do* M.assign "exp_head" [[
    M.get_field ~(| ethereum_types.numeric.Uint, "from_be_bytes" |) ~(|
      memory.buffer_read ~(|
        M.get_local ~(| "data" |),
        M.get_local ~(| "exp_start" |),
        M.get_local ~(| "min" |) ~(|
          ethereum_types.numeric.U256 ~(|
            32
          |),
          M.get_local ~(| "exp_length" |)
        |)
      |)
    |) in
  ]] in
  do* [[ vm.gas.charge_gas ~(|
    evm,
    M.get_local ~(| "gas_cost" |) ~(|
      M.get_local ~(| "base_length" |),
      M.get_local ~(| "modulus_length" |),
      M.get_local ~(| "exp_length" |),
      M.get_local ~(| "exp_head" |)
    |)
  |) ]] in
  (* TODO statement *)
  do* M.assign "base" [[
    M.get_field ~(| ethereum_types.numeric.Uint, "from_be_bytes" |) ~(|
      memory.buffer_read ~(|
        M.get_local ~(| "data" |),
        ethereum_types.numeric.U256 ~(|
          96
        |),
        M.get_local ~(| "base_length" |)
      |)
    |) in
  ]] in
  do* M.assign "exp" [[
    M.get_field ~(| ethereum_types.numeric.Uint, "from_be_bytes" |) ~(|
      memory.buffer_read ~(|
        M.get_local ~(| "data" |),
        M.get_local ~(| "exp_start" |),
        M.get_local ~(| "exp_length" |)
      |)
    |) in
  ]] in
  do* M.assign "modulus_start" [[
    (* TODO expression *) in
  ]] in
  do* M.assign "modulus" [[
    M.get_field ~(| ethereum_types.numeric.Uint, "from_be_bytes" |) ~(|
      memory.buffer_read ~(|
        M.get_local ~(| "data" |),
        M.get_local ~(| "modulus_start" |),
        M.get_local ~(| "modulus_length" |)
      |)
    |) in
  ]] in
  (* TODO statement *)
  M.pure tt.

Definition complexity (base_length : U256) (modulus_length : U256) : M Uint :=
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
  do* M.assign "max_length" [[
    M.get_local ~(| "max" |) ~(|
      ethereum_types.numeric.Uint ~(|
        base_length
      |),
      ethereum_types.numeric.Uint ~(|
        modulus_length
      |)
    |) in
  ]] in
  (* TODO statement *)
  M.pure tt.

Definition iterations (exponent_length : U256) (exponent_head : Uint) : M Uint :=
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
  M.pure tt.

Definition gas_cost (base_length : U256) (modulus_length : U256) (exponent_length : U256) (exponent_head : Uint) : M Uint :=
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
  do* M.assign "multiplication_complexity" [[
    M.get_local ~(| "complexity" |) ~(|
      base_length,
      modulus_length
    |) in
  ]] in
  do* M.assign "iteration_count" [[
    M.get_local ~(| "iterations" |) ~(|
      exponent_length,
      exponent_head
    |) in
  ]] in
  do* M.assign "cost" [[
    (* TODO expression *) in
  ]] in
  do* M.aug_assign [[ M.get_local ~(| "cost" |) ]] [[
    M.get_local ~(| "GQUADDIVISOR" |)
  ]] in
  (* TODO statement *)
  M.pure tt.
