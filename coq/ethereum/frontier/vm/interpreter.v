(*
Ethereum Virtual Machine (EVM) Interpreter
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

A straightforward interpreter that executes EVM code.
*)

Require dataclasses.
Require typing.
Require ethereum_types.bytes.
Require ethereum_types.numeric.
Require ethereum.trace.
Require frontier.blocks.
Require frontier.fork_types.
Require frontier.state.
Require frontier.vm.
Require frontier.vm.gas.
Require frontier.vm.precompiled_contracts.mapping.
Require frontier.vm.exceptions.
Require frontier.vm.instructions.
Require frontier.vm.runtime.

Definition process_message_call : M unit :=
  (*
      If `message.current` is empty then it creates a smart contract
      else it executes a call from the `message.caller` to the `message.target`.

      Parameters
      ----------
      message :
          Transaction specific items.

      env :
          External items required for EVM execution.

      Returns
      -------
      output : `MessageCallOutput`
          Output of the message call
      *)
  (* TODO statement *)
  (* TODO statement *)
  let* tx_end := ethereum.trace.TransactionEnd (|
    (* TODO expression *),
    evm.["output"],
    evm.["error"]
  |) in
  do* ethereum.trace.evm_trace (|
    evm,
    tx_end
  |) in
  (* TODO statement *)


Definition process_create_message : M unit :=
  (*
      Executes a call to create a smart contract.

      Parameters
      ----------
      message :
          Transaction specific items.
      env :
          External items required for EVM execution.

      Returns
      -------
      evm: :py:class:`~ethereum.frontier.vm.Evm`
          Items containing execution specific objects.
      *)
  do* state.begin_transaction (|
    env.["state"]
  |) in
  do* state.destroy_storage (|
    env.["state"],
    message.["current_target"]
  |) in
  let* evm := process_message (|
    message,
    env
  |) in
  (* TODO statement *)
  (* TODO statement *)


Definition process_message : M unit :=
  (*
      Executes a call to create a smart contract.

      Parameters
      ----------
      message :
          Transaction specific items.
      env :
          External items required for EVM execution.

      Returns
      -------
      evm: :py:class:`~ethereum.frontier.vm.Evm`
          Items containing execution specific objects
      *)
  (* TODO statement *)
  do* state.begin_transaction (|
    env.["state"]
  |) in
  do* state.touch_account (|
    env.["state"],
    message.["current_target"]
  |) in
  (* TODO statement *)
  let* evm := execute_code (|
    message,
    env
  |) in
  (* TODO statement *)
  (* TODO statement *)


Definition execute_code : M unit :=
  (*
      Executes bytecode present in the `message`.

      Parameters
      ----------
      message :
          Transaction specific items.
      env :
          External items required for EVM execution.

      Returns
      -------
      evm: `ethereum.vm.EVM`
          Items containing execution specific objects
      *)
  let* code := message.["code"] in
  let* valid_jump_destinations := runtime.get_valid_jump_destinations (|
    code
  |) in
  let* evm := Evm (|

  |) in
  (* TODO statement *)
  (* TODO statement *)

