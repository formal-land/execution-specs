(* Generated *)
(*
Ethereum Virtual Machine (EVM) Keccak Instructions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Implementations of the EVM keccak instructions.
*)

Require ethereum_types.numeric.
Require ethereum.crypto.hash.
Require ethereum.utils.numeric.
Require ethereum.gray_glacier.vm.__init__.
Require ethereum.gray_glacier.vm.gas.
Require ethereum.gray_glacier.vm.memory.
Require ethereum.gray_glacier.vm.stack.

Definition keccak (evm : Evm) : M unit :=
  (*
      Pushes to the stack the Keccak-256 hash of a region of memory.

      This also expands the memory, in case the memory is insufficient to
      access the data's memory location.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  do* M.assign "memory_start_index" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "size" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "words" [[
    (* TODO expression *) in
  ]] in
  do* M.assign "word_gas_cost" [[
    (* TODO expression *) in
  ]] in
  do* M.assign "extend_memory" [[
    gas.calculate_gas_extend_memory ~(|
      M.get_field ~(| evm, "memory" |),
      (* TODO expression *)
    |) in
  ]] in
  do* [[ gas.charge_gas ~(|
    evm,
    (* TODO expression *)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "memory" |) ]] [[
    (* TODO expression *)
  ]] in
  do* M.assign "data" [[
    memory.memory_read_bytes ~(|
      M.get_field ~(| evm, "memory" |),
      M.get_local ~(| "memory_start_index" |),
      M.get_local ~(| "size" |)
    |) in
  ]] in
  do* M.assign "hash" [[
    ethereum.crypto.hash.keccak256 ~(|
      M.get_local ~(| "data" |)
    |) in
  ]] in
  do* [[ stack.push ~(|
    M.get_field ~(| evm, "stack" |),
    M.get_field ~(| ethereum_types.numeric.U256, "from_be_bytes" |) ~(|
      M.get_local ~(| "hash" |)
    |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.
