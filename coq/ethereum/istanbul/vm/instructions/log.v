(* Generated *)
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
Require ethereum.istanbul.blocks.
Require ethereum.istanbul.vm.__init__.
Require ethereum.istanbul.vm.exceptions.
Require ethereum.istanbul.vm.gas.
Require ethereum.istanbul.vm.memory.
Require ethereum.istanbul.vm.stack.

Definition log_n (evm : Evm) (num_topics : U256) : M unit :=
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
  do* M.assign "topics" [[
    (* TODO expression *) in
  ]] in
  (* TODO statement *)
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
  (* TODO statement *)
  do* M.assign "log_entry" [[
    blocks.Log ~(|

    |) in
  ]] in
  (* TODO assignment *)
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.
