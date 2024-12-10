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
Require frontier.fork_types.
Require frontier.state.
Require frontier.vm.exceptions.

Definition charge_gas : M unit :=
  (*
      Subtracts `amount` from `evm.gas_left`.

      Parameters
      ----------
      evm :
          The current EVM.
      amount :
          The amount of gas the current operation requires.

      *)
  do* ethereum.trace.evm_trace (|
    evm,
    ethereum.trace.GasAndRefund (|
      int (|
        amount
      |)
    |)
  |) in
  (* TODO statement *)


Definition calculate_memory_gas_cost : M unit :=
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
  let* size_in_words := (* TODO expression *) in
  let* linear_cost := (* TODO expression *) in
  let* quadratic_cost := (* TODO expression *) in
  let* total_gas_cost := (* TODO expression *) in
  (* TODO statement *)


Definition calculate_gas_extend_memory : M unit :=
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
  let* size_to_extend := ethereum_types.numeric.Uint (|
    (* TODO expression *)
  |) in
  let* to_be_paid := ethereum_types.numeric.Uint (|
    (* TODO expression *)
  |) in
  let* current_size := ethereum_types.numeric.Uint (|
    len (|
      memory
    |)
  |) in
  (* TODO statement *)
  (* TODO statement *)


Definition calculate_message_call_gas : M unit :=
  (*
      Calculates the gas amount for executing Opcodes `CALL` and `CALLCODE`.

      Parameters
      ----------
      state :
          The current state.
      gas :
          The amount of gas provided to the message-call.
      to:
          The address of the recipient account.
      value:
          The amount of `ETH` that needs to be transferred.

      Returns
      -------
      message_call_gas: `MessageCallGas`
      *)
  let* create_gas_cost := (* TODO expression *) in
  let* transfer_gas_cost := (* TODO expression *) in
  let* cost := (* TODO expression *) in
  let* stipend := (* TODO expression *) in
  (* TODO statement *)

