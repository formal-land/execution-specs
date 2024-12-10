(*
Ethereum Virtual Machine (EVM) Stack Instructions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Implementations of the EVM stack related instructions.
*)

Require functools.
Require ethereum_types.numeric.
Require muir_glacier.vm.exceptions.
Require muir_glacier.vm.gas.
Require muir_glacier.vm.memory.

Definition pop : M unit :=
  (*
      Remove item from stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  do* stack.["pop"] (|
    evm.["stack"]
  |) in
  do* gas.charge_gas (|
    evm,
    gas.GAS_BASE
  |) in
  (* TODO statement *)
  (* TODO statement *)


Definition push_n : M unit :=
  (*
      Pushes a N-byte immediate onto the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      num_bytes :
          The number of immediate bytes to be read from the code and pushed to
          the stack.

      *)
  (* TODO statement *)
  do* gas.charge_gas (|
    evm,
    gas.GAS_VERY_LOW
  |) in
  let* data_to_push := ethereum_types.numeric.U256.["from_be_bytes"] (|
    memory.buffer_read (|
      evm.["code"],
      ethereum_types.numeric.U256 (|
        (* TODO expression *)
      |),
      ethereum_types.numeric.U256 (|
        num_bytes
      |)
    |)
  |) in
  do* stack.["push"] (|
    evm.["stack"],
    data_to_push
  |) in
  (* TODO statement *)


Definition dup_n : M unit :=
  (*
      Duplicate the Nth stack item (from top of the stack) to the top of stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      item_number :
          The stack item number (0-indexed from top of stack) to be duplicated
          to the top of stack.

      *)
  (* TODO statement *)
  do* gas.charge_gas (|
    evm,
    gas.GAS_VERY_LOW
  |) in
  (* TODO statement *)
  let* data_to_duplicate := (* TODO expression *) in
  do* stack.["push"] (|
    evm.["stack"],
    data_to_duplicate
  |) in
  (* TODO statement *)


Definition swap_n : M unit :=
  (*
      Swap the top and the `item_number` element of the stack, where
      the top of the stack is position zero.

      If `item_number` is zero, this function does nothing (which should not be
      possible, since there is no `SWAP0` instruction).

      Parameters
      ----------
      evm :
          The current EVM frame.

      item_number :
          The stack item number (0-indexed from top of stack) to be swapped
          with the top of stack element.

      *)
  (* TODO statement *)
  do* gas.charge_gas (|
    evm,
    gas.GAS_VERY_LOW
  |) in
  (* TODO statement *)
  (* TODO assignment *)
  (* TODO statement *)

