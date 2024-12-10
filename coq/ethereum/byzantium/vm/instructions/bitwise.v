(*
Ethereum Virtual Machine (EVM) Bitwise Instructions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Implementations of the EVM bitwise instructions.
*)

Require ethereum_types.numeric.
Require byzantium.vm.gas.
Require byzantium.vm.stack.

Definition bitwise_and : M unit :=
  (*
      Bitwise AND operation of the top 2 elements of the stack. Pushes the
      result back on the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  let* x := stack.pop (|
    evm.["stack"]
  |) in
  let* y := stack.pop (|
    evm.["stack"]
  |) in
  do* gas.charge_gas (|
    evm,
    gas.GAS_VERY_LOW
  |) in
  do* stack.push (|
    evm.["stack"],
    (* TODO expression *)
  |) in
  (* TODO statement *)


Definition bitwise_or : M unit :=
  (*
      Bitwise OR operation of the top 2 elements of the stack. Pushes the
      result back on the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  let* x := stack.pop (|
    evm.["stack"]
  |) in
  let* y := stack.pop (|
    evm.["stack"]
  |) in
  do* gas.charge_gas (|
    evm,
    gas.GAS_VERY_LOW
  |) in
  do* stack.push (|
    evm.["stack"],
    (* TODO expression *)
  |) in
  (* TODO statement *)


Definition bitwise_xor : M unit :=
  (*
      Bitwise XOR operation of the top 2 elements of the stack. Pushes the
      result back on the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  let* x := stack.pop (|
    evm.["stack"]
  |) in
  let* y := stack.pop (|
    evm.["stack"]
  |) in
  do* gas.charge_gas (|
    evm,
    gas.GAS_VERY_LOW
  |) in
  do* stack.push (|
    evm.["stack"],
    (* TODO expression *)
  |) in
  (* TODO statement *)


Definition bitwise_not : M unit :=
  (*
      Bitwise NOT operation of the top element of the stack. Pushes the
      result back on the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  let* x := stack.pop (|
    evm.["stack"]
  |) in
  do* gas.charge_gas (|
    evm,
    gas.GAS_VERY_LOW
  |) in
  do* stack.push (|
    evm.["stack"],
    (* TODO expression *)
  |) in
  (* TODO statement *)


Definition get_byte : M unit :=
  (*
      For a word (defined by next top element of the stack), retrieve the
      Nth byte (0-indexed and defined by top element of stack) from the
      left (most significant) to right (least significant).

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  let* byte_index := stack.pop (|
    evm.["stack"]
  |) in
  let* word := stack.pop (|
    evm.["stack"]
  |) in
  do* gas.charge_gas (|
    evm,
    gas.GAS_VERY_LOW
  |) in
  (* TODO statement *)
  do* stack.push (|
    evm.["stack"],
    result
  |) in
  (* TODO statement *)

