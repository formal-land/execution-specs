(* Generated *)
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
Require ethereum.frontier.state.
Require ethereum.frontier.vm.__init__.
Require ethereum.frontier.vm.gas.
Require ethereum.frontier.vm.stack.

Definition sload (evm : Evm) : M unit :=
  (*
      Loads to the stack, the value corresponding to a certain key from the
      storage of the current account.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  do* M.assign "key" [[
    M.get_field ~(| stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |), "to_be_bytes32" |) ~(|

    |) in
  ]] in
  do* [[ gas.charge_gas ~(|
    evm,
    gas.GAS_SLOAD
  |) ]] in
  do* M.assign "value" [[
    state.get_storage ~(|
      M.get_field ~(| M.get_field ~(| evm, "env" |), "state" |),
      M.get_field ~(| M.get_field ~(| evm, "message" |), "current_target" |),
      M.get_local ~(| "key" |)
    |) in
  ]] in
  do* [[ stack.push ~(|
    M.get_field ~(| evm, "stack" |),
    M.get_local ~(| "value" |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition sstore (evm : Evm) : M unit :=
  (*
      Stores a value at a certain key in the current context's storage.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  do* M.assign "key" [[
    M.get_field ~(| stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |), "to_be_bytes32" |) ~(|

    |) in
  ]] in
  do* M.assign "new_value" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "current_value" [[
    state.get_storage ~(|
      M.get_field ~(| M.get_field ~(| evm, "env" |), "state" |),
      M.get_field ~(| M.get_field ~(| evm, "message" |), "current_target" |),
      M.get_local ~(| "key" |)
    |) in
  ]] in
  (* TODO statement *)
  (* TODO statement *)
  do* [[ gas.charge_gas ~(|
    evm,
    M.get_local ~(| "gas_cost" |)
  |) ]] in
  do* [[ state.set_storage ~(|
    M.get_field ~(| M.get_field ~(| evm, "env" |), "state" |),
    M.get_field ~(| M.get_field ~(| evm, "message" |), "current_target" |),
    M.get_local ~(| "key" |),
    M.get_local ~(| "new_value" |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.
