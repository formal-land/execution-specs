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
Require homestead.vm.gas.
Require homestead.vm.exceptions.
Require homestead.vm.stack.

Definition stop : M unit :=
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
  (* TODO statement *)


Definition jump : M unit :=
  (*
      Alter the program counter to the location specified by the top of the
      stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  let* jump_dest := ethereum_types.numeric.Uint (|
    stack.pop (|
      evm.["stack"]
    |)
  |) in
  do* vm.gas.charge_gas (|
    evm,
    vm.gas.GAS_MID
  |) in
  (* TODO statement *)
  (* TODO assignment *)


Definition jumpi : M unit :=
  (*
      Alter the program counter to the specified location if and only if a
      condition is true. If the condition is not true, then the program counter
      would increase only by 1.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  let* jump_dest := ethereum_types.numeric.Uint (|
    stack.pop (|
      evm.["stack"]
    |)
  |) in
  let* conditional_value := stack.pop (|
    evm.["stack"]
  |) in
  do* vm.gas.charge_gas (|
    evm,
    vm.gas.GAS_HIGH
  |) in
  (* TODO statement *)
  (* TODO assignment *)


Definition pc : M unit :=
  (*
      Push onto the stack the value of the program counter after reaching the
      current instruction and without increasing it for the next instruction.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  (* TODO statement *)
  do* vm.gas.charge_gas (|
    evm,
    vm.gas.GAS_BASE
  |) in
  do* stack.push (|
    evm.["stack"],
    ethereum_types.numeric.U256 (|
      evm.["pc"]
    |)
  |) in
  (* TODO statement *)


Definition gas_left : M unit :=
  (*
      Push the amount of available gas (including the corresponding reduction
      for the cost of this instruction) onto the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  (* TODO statement *)
  do* vm.gas.charge_gas (|
    evm,
    vm.gas.GAS_BASE
  |) in
  do* stack.push (|
    evm.["stack"],
    ethereum_types.numeric.U256 (|
      evm.["gas_left"]
    |)
  |) in
  (* TODO statement *)


Definition jumpdest : M unit :=
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
  do* vm.gas.charge_gas (|
    evm,
    vm.gas.GAS_JUMPDEST
  |) in
  (* TODO statement *)
  (* TODO statement *)

