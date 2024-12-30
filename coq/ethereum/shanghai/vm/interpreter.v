(* Generated *)
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
Require ethereum.shanghai.blocks.
Require ethereum.shanghai.fork_types.
Require ethereum.shanghai.state.
Require ethereum.shanghai.vm.
Require ethereum.shanghai.vm.gas.
Require ethereum.shanghai.vm.precompiled_contracts.mapping.
Require ethereum.shanghai.vm.__init__.
Require ethereum.shanghai.vm.exceptions.
Require ethereum.shanghai.vm.instructions.
Require ethereum.shanghai.vm.runtime.

Definition process_message_call (message : Message) (env : Environment) : M MessageCallOutput :=
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
  do* M.assign "tx_end" [[
    ethereum.trace.TransactionEnd ~(|
      (* TODO expression *),
      M.get_field ~(| M.get_local ~(| "evm" |), "output" |),
      M.get_field ~(| M.get_local ~(| "evm" |), "error" |)
    |) in
  ]] in
  do* [[ ethereum.trace.evm_trace ~(|
    M.get_local ~(| "evm" |),
    M.get_local ~(| "tx_end" |)
  |) ]] in
  (* TODO statement *)
  M.pure tt.

Definition process_create_message (message : Message) (env : Environment) : M Evm :=
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
      evm: :py:class:`~ethereum.shanghai.vm.Evm`
          Items containing execution specific objects.
      *)
  do* [[ state.begin_transaction ~(|
    M.get_field ~(| env, "state" |)
  |) ]] in
  do* [[ state.destroy_storage ~(|
    M.get_field ~(| env, "state" |),
    M.get_field ~(| message, "current_target" |)
  |) ]] in
  do* [[ state.mark_account_created ~(|
    M.get_field ~(| env, "state" |),
    M.get_field ~(| message, "current_target" |)
  |) ]] in
  do* [[ state.increment_nonce ~(|
    M.get_field ~(| env, "state" |),
    M.get_field ~(| message, "current_target" |)
  |) ]] in
  do* M.assign "evm" [[
    M.get_local ~(| "process_message" |) ~(|
      message,
      env
    |) in
  ]] in
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.

Definition process_message (message : Message) (env : Environment) : M Evm :=
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
      evm: :py:class:`~ethereum.shanghai.vm.Evm`
          Items containing execution specific objects
      *)
  (* TODO statement *)
  do* [[ state.begin_transaction ~(|
    M.get_field ~(| env, "state" |)
  |) ]] in
  do* [[ state.touch_account ~(|
    M.get_field ~(| env, "state" |),
    M.get_field ~(| message, "current_target" |)
  |) ]] in
  (* TODO statement *)
  do* M.assign "evm" [[
    M.get_local ~(| "execute_code" |) ~(|
      message,
      env
    |) in
  ]] in
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.

Definition execute_code (message : Message) (env : Environment) : M Evm :=
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
  do* M.assign "code" [[
    M.get_field ~(| message, "code" |) in
  ]] in
  do* M.assign "valid_jump_destinations" [[
    runtime.get_valid_jump_destinations ~(|
      M.get_local ~(| "code" |)
    |) in
  ]] in
  do* M.assign "evm" [[
    __init__.Evm ~(|

    |) in
  ]] in
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.
