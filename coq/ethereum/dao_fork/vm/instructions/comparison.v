(*
Ethereum Virtual Machine (EVM) Comparison Instructions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Implementations of the EVM Comparison instructions.
*)

Require ethereum_types.numeric.
Require dao_fork.vm.gas.
Require dao_fork.vm.stack.

Definition less_than : M unit :=
  (*
      Checks if the top element is less than the next top element. Pushes the
      result back on the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  let* left := stack.pop (|
    evm.["stack"]
  |) in
  let* right := stack.pop (|
    evm.["stack"]
  |) in
  do* gas.charge_gas (|
    evm,
    gas.GAS_VERY_LOW
  |) in
  let* result := ethereum_types.numeric.U256 (|
    (* TODO expression *)
  |) in
  do* stack.push (|
    evm.["stack"],
    result
  |) in
  (* TODO statement *)


Definition signed_less_than : M unit :=
  (*
      Signed less-than comparison.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  let* left := stack.pop (|
    evm.["stack"]
  |).["to_signed"] (|

  |) in
  let* right := stack.pop (|
    evm.["stack"]
  |).["to_signed"] (|

  |) in
  do* gas.charge_gas (|
    evm,
    gas.GAS_VERY_LOW
  |) in
  let* result := ethereum_types.numeric.U256 (|
    (* TODO expression *)
  |) in
  do* stack.push (|
    evm.["stack"],
    result
  |) in
  (* TODO statement *)


Definition greater_than : M unit :=
  (*
      Checks if the top element is greater than the next top element. Pushes
      the result back on the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  let* left := stack.pop (|
    evm.["stack"]
  |) in
  let* right := stack.pop (|
    evm.["stack"]
  |) in
  do* gas.charge_gas (|
    evm,
    gas.GAS_VERY_LOW
  |) in
  let* result := ethereum_types.numeric.U256 (|
    (* TODO expression *)
  |) in
  do* stack.push (|
    evm.["stack"],
    result
  |) in
  (* TODO statement *)


Definition signed_greater_than : M unit :=
  (*
      Signed greater-than comparison.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  let* left := stack.pop (|
    evm.["stack"]
  |).["to_signed"] (|

  |) in
  let* right := stack.pop (|
    evm.["stack"]
  |).["to_signed"] (|

  |) in
  do* gas.charge_gas (|
    evm,
    gas.GAS_VERY_LOW
  |) in
  let* result := ethereum_types.numeric.U256 (|
    (* TODO expression *)
  |) in
  do* stack.push (|
    evm.["stack"],
    result
  |) in
  (* TODO statement *)


Definition equal : M unit :=
  (*
      Checks if the top element is equal to the next top element. Pushes
      the result back on the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  let* left := stack.pop (|
    evm.["stack"]
  |) in
  let* right := stack.pop (|
    evm.["stack"]
  |) in
  do* gas.charge_gas (|
    evm,
    gas.GAS_VERY_LOW
  |) in
  let* result := ethereum_types.numeric.U256 (|
    (* TODO expression *)
  |) in
  do* stack.push (|
    evm.["stack"],
    result
  |) in
  (* TODO statement *)


Definition is_zero : M unit :=
  (*
      Checks if the top element is equal to 0. Pushes the result back on the
      stack.

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
  let* result := ethereum_types.numeric.U256 (|
    (* TODO expression *)
  |) in
  do* stack.push (|
    evm.["stack"],
    result
  |) in
  (* TODO statement *)

