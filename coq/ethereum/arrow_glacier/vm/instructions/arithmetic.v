(*
Ethereum Virtual Machine (EVM) Arithmetic Instructions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Implementations of the EVM Arithmetic instructions.
*)

Require ethereum_types.numeric.
Require ethereum.utils.numeric.
Require arrow_glacier.vm.gas.
Require arrow_glacier.vm.stack.

Definition add : M unit :=
  (*
      Adds the top two elements of the stack together, and pushes the result back
      on the stack.

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
  let* result := x.["wrapping_add"] (|
    y
  |) in
  do* stack.push (|
    evm.["stack"],
    result
  |) in
  (* TODO statement *)


Definition sub : M unit :=
  (*
      Subtracts the top two elements of the stack, and pushes the result back
      on the stack.

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
  let* result := x.["wrapping_sub"] (|
    y
  |) in
  do* stack.push (|
    evm.["stack"],
    result
  |) in
  (* TODO statement *)


Definition mul : M unit :=
  (*
      Multiply the top two elements of the stack, and pushes the result back
      on the stack.

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
    gas.GAS_LOW
  |) in
  let* result := x.["wrapping_mul"] (|
    y
  |) in
  do* stack.push (|
    evm.["stack"],
    result
  |) in
  (* TODO statement *)


Definition div : M unit :=
  (*
      Integer division of the top two elements of the stack. Pushes the result
      back on the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  let* dividend := stack.pop (|
    evm.["stack"]
  |) in
  let* divisor := stack.pop (|
    evm.["stack"]
  |) in
  do* gas.charge_gas (|
    evm,
    gas.GAS_LOW
  |) in
  (* TODO statement *)
  do* stack.push (|
    evm.["stack"],
    quotient
  |) in
  (* TODO statement *)


Definition sdiv : M unit :=
  (*
      Signed integer division of the top two elements of the stack. Pushes the
      result back on the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  let* dividend := stack.pop (|
    evm.["stack"]
  |).["to_signed"] (|

  |) in
  let* divisor := stack.pop (|
    evm.["stack"]
  |).["to_signed"] (|

  |) in
  do* gas.charge_gas (|
    evm,
    gas.GAS_LOW
  |) in
  (* TODO statement *)
  do* stack.push (|
    evm.["stack"],
    ethereum_types.numeric.U256.["from_signed"] (|
      quotient
    |)
  |) in
  (* TODO statement *)


Definition mod : M unit :=
  (*
      Modulo remainder of the top two elements of the stack. Pushes the result
      back on the stack.

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
    gas.GAS_LOW
  |) in
  (* TODO statement *)
  do* stack.push (|
    evm.["stack"],
    remainder
  |) in
  (* TODO statement *)


Definition smod : M unit :=
  (*
      Signed modulo remainder of the top two elements of the stack. Pushes the
      result back on the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  let* x := stack.pop (|
    evm.["stack"]
  |).["to_signed"] (|

  |) in
  let* y := stack.pop (|
    evm.["stack"]
  |).["to_signed"] (|

  |) in
  do* gas.charge_gas (|
    evm,
    gas.GAS_LOW
  |) in
  (* TODO statement *)
  do* stack.push (|
    evm.["stack"],
    ethereum_types.numeric.U256.["from_signed"] (|
      remainder
    |)
  |) in
  (* TODO statement *)


Definition addmod : M unit :=
  (*
      Modulo addition of the top 2 elements with the 3rd element. Pushes the
      result back on the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  let* x := ethereum_types.numeric.Uint (|
    stack.pop (|
      evm.["stack"]
    |)
  |) in
  let* y := ethereum_types.numeric.Uint (|
    stack.pop (|
      evm.["stack"]
    |)
  |) in
  let* z := ethereum_types.numeric.Uint (|
    stack.pop (|
      evm.["stack"]
    |)
  |) in
  do* gas.charge_gas (|
    evm,
    gas.GAS_MID
  |) in
  (* TODO statement *)
  do* stack.push (|
    evm.["stack"],
    result
  |) in
  (* TODO statement *)


Definition mulmod : M unit :=
  (*
      Modulo multiplication of the top 2 elements with the 3rd element. Pushes
      the result back on the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  let* x := ethereum_types.numeric.Uint (|
    stack.pop (|
      evm.["stack"]
    |)
  |) in
  let* y := ethereum_types.numeric.Uint (|
    stack.pop (|
      evm.["stack"]
    |)
  |) in
  let* z := ethereum_types.numeric.Uint (|
    stack.pop (|
      evm.["stack"]
    |)
  |) in
  do* gas.charge_gas (|
    evm,
    gas.GAS_MID
  |) in
  (* TODO statement *)
  do* stack.push (|
    evm.["stack"],
    result
  |) in
  (* TODO statement *)


Definition exp : M unit :=
  (*
      Exponential operation of the top 2 elements. Pushes the result back on
      the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  let* base := ethereum_types.numeric.Uint (|
    stack.pop (|
      evm.["stack"]
    |)
  |) in
  let* exponent := ethereum_types.numeric.Uint (|
    stack.pop (|
      evm.["stack"]
    |)
  |) in
  let* exponent_bits := exponent.["bit_length"] (|

  |) in
  let* exponent_bytes := (* TODO expression *) in
  do* gas.charge_gas (|
    evm,
    (* TODO expression *)
  |) in
  let* result := ethereum_types.numeric.U256 (|
    pow (|
      base,
      exponent,
      (* TODO expression *)
    |)
  |) in
  do* stack.push (|
    evm.["stack"],
    result
  |) in
  (* TODO statement *)


Definition signextend : M unit :=
  (*
      Sign extend operation. In other words, extend a signed number which
      fits in N bytes to 32 bytes.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  let* byte_num := stack.pop (|
    evm.["stack"]
  |) in
  let* value := stack.pop (|
    evm.["stack"]
  |) in
  do* gas.charge_gas (|
    evm,
    gas.GAS_LOW
  |) in
  (* TODO statement *)
  do* stack.push (|
    evm.["stack"],
    result
  |) in
  (* TODO statement *)

