(* Generated *)
(*
Ethereum Virtual Machine (EVM) Gas
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

EVM gas constants and calculators.
*)

Require dataclasses.
Require typing.
Require ethereum_types.numeric.
Require ethereum.trace.
Require ethereum.utils.numeric.
Require ethereum.london.vm.__init__.
Require ethereum.london.vm.exceptions.

Definition charge_gas (evm : Evm) (amount : Uint) : M unit :=
  (*
      Subtracts `amount` from `evm.gas_left`.

      Parameters
      ----------
      evm :
          The current EVM.
      amount :
          The amount of gas the current operation requires.

      *)
  do* [[ ethereum.trace.evm_trace ~(|
    evm,
    ethereum.trace.GasAndRefund ~(|
      M.get_local ~(| "int" |) ~(|
        amount
      |)
    |)
  |) ]] in
  (* TODO statement *)
  M.pure tt.

Definition calculate_memory_gas_cost (size_in_bytes : Uint) : M Uint :=
  (*
      Calculates the gas cost for allocating memory
      to the smallest multiple of 32 bytes,
      such that the allocated size is at least as big as the given size.

      Parameters
      ----------
      size_in_bytes :
          The size of the data in bytes.

      Returns
      -------
      total_gas_cost : `ethereum.base_types.Uint`
          The gas cost for storing data in memory.
      *)
  do* M.assign "size_in_words" [[
    (* TODO expression *) in
  ]] in
  do* M.assign "linear_cost" [[
    (* TODO expression *) in
  ]] in
  do* M.assign "quadratic_cost" [[
    (* TODO expression *) in
  ]] in
  do* M.assign "total_gas_cost" [[
    (* TODO expression *) in
  ]] in
  (* TODO statement *)
  M.pure tt.

Definition calculate_gas_extend_memory (memory : bytearray) (extensions : (* TODO type *)) : M ExtendMemory :=
  (*
      Calculates the gas amount to extend memory

      Parameters
      ----------
      memory :
          Memory contents of the EVM.
      extensions:
          List of extensions to be made to the memory.
          Consists of a tuple of start position and size.

      Returns
      -------
      extend_memory: `ExtendMemory`
      *)
  do* M.assign "size_to_extend" [[
    ethereum_types.numeric.Uint ~(|
      0
    |) in
  ]] in
  do* M.assign "to_be_paid" [[
    ethereum_types.numeric.Uint ~(|
      0
    |) in
  ]] in
  do* M.assign "current_size" [[
    ethereum_types.numeric.Uint ~(|
      M.get_local ~(| "len" |) ~(|
        memory
      |)
    |) in
  ]] in
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.

Definition calculate_message_call_gas (value : U256) (gas : Uint) (gas_left : Uint) (memory_cost : Uint) (extra_gas : Uint) (call_stipend : Uint) : M MessageCallGas :=
  (*
      Calculates the MessageCallGas (cost and stipend) for
      executing call Opcodes.

      Parameters
      ----------
      value:
          The amount of `ETH` that needs to be transferred.
      gas :
          The amount of gas provided to the message-call.
      gas_left :
          The amount of gas left in the current frame.
      memory_cost :
          The amount needed to extend the memory in the current frame.
      extra_gas :
          The amount of gas needed for transferring value + creating a new
          account inside a message call.
      call_stipend :
          The amount of stipend provided to a message call to execute code while
          transferring value(ETH).

      Returns
      -------
      message_call_gas: `MessageCallGas`
      *)
  do* M.assign "call_stipend" [[
    (* TODO expression *) in
  ]] in
  (* TODO statement *)
  do* M.assign "gas" [[
    M.get_local ~(| "min" |) ~(|
      gas,
      M.get_local ~(| "max_message_call_gas" |) ~(|
        (* TODO expression *)
      |)
    |) in
  ]] in
  (* TODO statement *)
  M.pure tt.

Definition max_message_call_gas (gas : Uint) : M Uint :=
  (*
      Calculates the maximum gas that is allowed for making a message call

      Parameters
      ----------
      gas :
          The amount of gas provided to the message-call.

      Returns
      -------
      max_allowed_message_call_gas: `ethereum.base_types.Uint`
          The maximum gas allowed for making the message-call.
      *)
  (* TODO statement *)
  M.pure tt.
