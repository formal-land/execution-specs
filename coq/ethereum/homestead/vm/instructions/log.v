(*
Ethereum Virtual Machine (EVM) Logging Instructions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Implementations of the EVM logging instructions.
*)

Require functools.
Require ethereum_types.numeric.
Require homestead.blocks.
Require homestead.vm.gas.
Require homestead.vm.memory.
Require homestead.vm.stack.

Definition log_n : M unit :=
  (*
      Appends a log entry, having `num_topics` topics, to the evm logs.

      This will also expand the memory if the data (required by the log entry)
      corresponding to the memory is not accessible.

      Parameters
      ----------
      evm :
          The current EVM frame.
      num_topics :
          The number of topics to be included in the log entry.

      *)
  let* memory_start_index := stack.pop (|
    evm.["stack"]
  |) in
  let* size := stack.pop (|
    evm.["stack"]
  |) in
  let* topics := (* TODO expression *) in
  (* TODO statement *)
  let* extend_memory := gas.calculate_gas_extend_memory (|
    evm.["memory"],
    (* TODO expression *)
  |) in
  do* gas.charge_gas (|
    evm,
    (* TODO expression *)
  |) in
  (* TODO statement *)
  let* log_entry := blocks.Log (|

  |) in
  (* TODO assignment *)
  (* TODO statement *)

