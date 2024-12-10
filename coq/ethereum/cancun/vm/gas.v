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
Require cancun.blocks.
Require cancun.transactions.
Require cancun.vm.exceptions.

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
  let* call_stipend := (* TODO expression *) in
  (* TODO statement *)
  let* gas := min (|
    gas,
    max_message_call_gas (|
      (* TODO expression *)
    |)
  |) in
  (* TODO statement *)


Definition max_message_call_gas : M unit :=
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


Definition init_code_cost : M unit :=
  (*
      Calculates the gas to be charged for the init code in CREAT*
      opcodes as well as create transactions.

      Parameters
      ----------
      init_code_length :
          The length of the init code provided to the opcode
          or a create transaction

      Returns
      -------
      init_code_gas: `ethereum.base_types.Uint`
          The gas to be charged for the init code.
      *)
  (* TODO statement *)


Definition calculate_excess_blob_gas : M unit :=
  (*
      Calculated the excess blob gas for the current block based
      on the gas used in the parent block.

      Parameters
      ----------
      parent_header :
          The parent block of the current block.

      Returns
      -------
      excess_blob_gas: `ethereum.base_types.U64`
          The excess blob gas for the current block.
      *)
  let* excess_blob_gas := ethereum_types.numeric.U64 (|
    (* TODO expression *)
  |) in
  let* blob_gas_used := ethereum_types.numeric.U64 (|
    (* TODO expression *)
  |) in
  (* TODO statement *)
  let* parent_blob_gas := (* TODO expression *) in
  (* TODO statement *)


Definition calculate_total_blob_gas : M unit :=
  (*
      Calculate the total blob gas for a transaction.

      Parameters
      ----------
      tx :
          The transaction for which the blob gas is to be calculated.

      Returns
      -------
      total_blob_gas: `ethereum.base_types.Uint`
          The total blob gas for the transaction.
      *)
  (* TODO statement *)


Definition calculate_blob_gas_price : M unit :=
  (*
      Calculate the blob gasprice for a block.

      Parameters
      ----------
      excess_blob_gas :
          The excess blob gas for the block.

      Returns
      -------
      blob_gasprice: `Uint`
          The blob gasprice.
      *)
  (* TODO statement *)


Definition calculate_data_fee : M unit :=
  (*
      Calculate the blob data fee for a transaction.

      Parameters
      ----------
      excess_blob_gas :
          The excess_blob_gas for the execution.
      tx :
          The transaction for which the blob data fee is to be calculated.

      Returns
      -------
      data_fee: `Uint`
          The blob data fee.
      *)
  (* TODO statement *)

