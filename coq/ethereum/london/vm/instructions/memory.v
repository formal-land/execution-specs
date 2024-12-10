(*
Ethereum Virtual Machine (EVM) Memory Instructions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Implementations of the EVM Memory instructions.
*)

Require ethereum_types.bytes.
Require ethereum_types.numeric.
Require london.vm.gas.
Require london.vm.memory.
Require london.vm.stack.

Definition mstore : M unit :=
  (*
      Stores a word to memory.
      This also expands the memory, if the memory is
      insufficient to store the word.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  let* start_position := stack.pop (|
    evm.["stack"]
  |) in
  let* value := stack.pop (|
    evm.["stack"]
  |).["to_be_bytes32"] (|

  |) in
  let* extend_memory := gas.calculate_gas_extend_memory (|
    evm.["memory"],
    (* TODO expression *)
  |) in
  do* gas.charge_gas (|
    evm,
    (* TODO expression *)
  |) in
  (* TODO statement *)
  do* memory.memory_write (|
    evm.["memory"],
    start_position,
    value
  |) in
  (* TODO statement *)


Definition mstore8 : M unit :=
  (*
      Stores a byte to memory.
      This also expands the memory, if the memory is
      insufficient to store the word.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  let* start_position := stack.pop (|
    evm.["stack"]
  |) in
  let* value := stack.pop (|
    evm.["stack"]
  |) in
  let* extend_memory := gas.calculate_gas_extend_memory (|
    evm.["memory"],
    (* TODO expression *)
  |) in
  do* gas.charge_gas (|
    evm,
    (* TODO expression *)
  |) in
  (* TODO statement *)
  let* normalized_bytes_value := ethereum_types.bytes.Bytes (|
    (* TODO expression *)
  |) in
  do* memory.memory_write (|
    evm.["memory"],
    start_position,
    normalized_bytes_value
  |) in
  (* TODO statement *)


Definition mload : M unit :=
  (*
      Load word from memory.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  let* start_position := stack.pop (|
    evm.["stack"]
  |) in
  let* extend_memory := gas.calculate_gas_extend_memory (|
    evm.["memory"],
    (* TODO expression *)
  |) in
  do* gas.charge_gas (|
    evm,
    (* TODO expression *)
  |) in
  (* TODO statement *)
  let* value := ethereum_types.numeric.U256.["from_be_bytes"] (|
    memory.memory_read_bytes (|
      evm.["memory"],
      start_position,
      ethereum_types.numeric.U256 (|
        (* TODO expression *)
      |)
    |)
  |) in
  do* stack.push (|
    evm.["stack"],
    value
  |) in
  (* TODO statement *)


Definition msize : M unit :=
  (*
      Push the size of active memory in bytes onto the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  (* TODO statement *)
  do* gas.charge_gas (|
    evm,
    gas.GAS_BASE
  |) in
  do* stack.push (|
    evm.["stack"],
    ethereum_types.numeric.U256 (|
      len (|
        evm.["memory"]
      |)
    |)
  |) in
  (* TODO statement *)

