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
Require paris.vm.gas.
Require paris.vm.memory.
Require paris.vm.stack.

Definition keccak : M unit :=
  (*
      Pushes to the stack the Keccak-256 hash of a region of memory.

      This also expands the memory, in case the memory is insufficient to
      access the data's memory location.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  let* memory_start_index := stack.pop (|
    evm.["stack"]
  |) in
  let* size := stack.pop (|
    evm.["stack"]
  |) in
  let* words := (* TODO expression *) in
  let* word_gas_cost := (* TODO expression *) in
  let* extend_memory := gas.calculate_gas_extend_memory (|
    evm.["memory"],
    (* TODO expression *)
  |) in
  do* gas.charge_gas (|
    evm,
    (* TODO expression *)
  |) in
  (* TODO statement *)
  let* data := memory.memory_read_bytes (|
    evm.["memory"],
    memory_start_index,
    size
  |) in
  let* hash := ethereum.crypto.hash.keccak256 (|
    data
  |) in
  do* stack.push (|
    evm.["stack"],
    ethereum_types.numeric.U256.["from_be_bytes"] (|
      hash
    |)
  |) in
  (* TODO statement *)

