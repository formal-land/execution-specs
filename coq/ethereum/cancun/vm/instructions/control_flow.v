(* Generated *)
(*
Ethereum Virtual Machine (EVM) Control Flow Instructions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Implementations of the EVM control flow instructions.
*)

Require ethereum_types.numeric.
Require ethereum.cancun.vm.gas.
Require ethereum.cancun.vm.__init__.
Require ethereum.cancun.vm.exceptions.
Require ethereum.cancun.vm.stack.

Definition stop (evm : Evm) : M unit :=
  (*
      Stop further execution of EVM code.

      Parameters
      ----------
      evm :
          The current EVM frame.
      *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO assignment *)
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition jump (evm : Evm) : M unit :=
  (*
      Alter the program counter to the location specified by the top of the
      stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  do* M.assign "jump_dest" [[
    ethereum_types.numeric.Uint ~(|
      stack.pop ~(|
        M.get_field ~(| evm, "stack" |)
      |)
    |) in
  ]] in
  do* [[ vm.gas.charge_gas ~(|
    evm,
    vm.gas.GAS_MID
  |) ]] in
  (* TODO statement *)
  (* TODO assignment *)
  M.pure tt.

Definition jumpi (evm : Evm) : M unit :=
  (*
      Alter the program counter to the specified location if and only if a
      condition is true. If the condition is not true, then the program counter
      would increase only by 1.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  do* M.assign "jump_dest" [[
    ethereum_types.numeric.Uint ~(|
      stack.pop ~(|
        M.get_field ~(| evm, "stack" |)
      |)
    |) in
  ]] in
  do* M.assign "conditional_value" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* [[ vm.gas.charge_gas ~(|
    evm,
    vm.gas.GAS_HIGH
  |) ]] in
  (* TODO statement *)
  (* TODO assignment *)
  M.pure tt.

Definition pc (evm : Evm) : M unit :=
  (*
      Push onto the stack the value of the program counter after reaching the
      current instruction and without increasing it for the next instruction.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  (* TODO statement *)
  do* [[ vm.gas.charge_gas ~(|
    evm,
    vm.gas.GAS_BASE
  |) ]] in
  do* [[ stack.push ~(|
    M.get_field ~(| evm, "stack" |),
    ethereum_types.numeric.U256 ~(|
      M.get_field ~(| evm, "pc" |)
    |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition gas_left (evm : Evm) : M unit :=
  (*
      Push the amount of available gas (including the corresponding reduction
      for the cost of this instruction) onto the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  (* TODO statement *)
  do* [[ vm.gas.charge_gas ~(|
    evm,
    vm.gas.GAS_BASE
  |) ]] in
  do* [[ stack.push ~(|
    M.get_field ~(| evm, "stack" |),
    ethereum_types.numeric.U256 ~(|
      M.get_field ~(| evm, "gas_left" |)
    |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition jumpdest (evm : Evm) : M unit :=
  (*
      Mark a valid destination for jumps. This is a noop, present only
      to be used by `JUMP` and `JUMPI` opcodes to verify that their jump is
      valid.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  (* TODO statement *)
  do* [[ vm.gas.charge_gas ~(|
    evm,
    vm.gas.GAS_JUMPDEST
  |) ]] in
  (* TODO statement *)
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.
