(*
Ethereum Virtual Machine (EVM) Storage Instructions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Implementations of the EVM storage related instructions.
*)

Require ethereum_types.numeric.
Require constantinople.state.
Require constantinople.vm.exceptions.
Require constantinople.vm.gas.
Require constantinople.vm.stack.

Definition sload : M unit :=
  (*
      Loads to the stack, the value corresponding to a certain key from the
      storage of the current account.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  let* key := stack.pop (|
    evm.["stack"]
  |).["to_be_bytes32"] (|

  |) in
  do* gas.charge_gas (|
    evm,
    gas.GAS_SLOAD
  |) in
  let* value := state.get_storage (|
    evm.["env"].["state"],
    evm.["message"].["current_target"],
    key
  |) in
  do* stack.push (|
    evm.["stack"],
    value
  |) in
  (* TODO statement *)


Definition sstore : M unit :=
  (*
      Stores a value at a certain key in the current context's storage.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  let* key := stack.pop (|
    evm.["stack"]
  |).["to_be_bytes32"] (|

  |) in
  let* new_value := stack.pop (|
    evm.["stack"]
  |) in
  let* current_value := state.get_storage (|
    evm.["env"].["state"],
    evm.["message"].["current_target"],
    key
  |) in
  (* TODO statement *)
  (* TODO statement *)
  do* gas.charge_gas (|
    evm,
    gas_cost
  |) in
  (* TODO statement *)
  do* state.set_storage (|
    evm.["env"].["state"],
    evm.["message"].["current_target"],
    key,
    new_value
  |) in
  (* TODO statement *)

