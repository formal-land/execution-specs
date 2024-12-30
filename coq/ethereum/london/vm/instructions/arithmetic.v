(* Generated *)
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
Require ethereum.london.vm.__init__.
Require ethereum.london.vm.gas.
Require ethereum.london.vm.stack.

Definition add (evm : Evm) : M unit :=
  (*
      Adds the top two elements of the stack together, and pushes the result back
      on the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  do* M.assign "x" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "y" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* [[ gas.charge_gas ~(|
    evm,
    gas.GAS_VERY_LOW
  |) ]] in
  do* M.assign "result" [[
    M.get_field ~(| M.get_local ~(| "x" |), "wrapping_add" |) ~(|
      M.get_local ~(| "y" |)
    |) in
  ]] in
  do* [[ stack.push ~(|
    M.get_field ~(| evm, "stack" |),
    M.get_local ~(| "result" |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition sub (evm : Evm) : M unit :=
  (*
      Subtracts the top two elements of the stack, and pushes the result back
      on the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  do* M.assign "x" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "y" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* [[ gas.charge_gas ~(|
    evm,
    gas.GAS_VERY_LOW
  |) ]] in
  do* M.assign "result" [[
    M.get_field ~(| M.get_local ~(| "x" |), "wrapping_sub" |) ~(|
      M.get_local ~(| "y" |)
    |) in
  ]] in
  do* [[ stack.push ~(|
    M.get_field ~(| evm, "stack" |),
    M.get_local ~(| "result" |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition mul (evm : Evm) : M unit :=
  (*
      Multiply the top two elements of the stack, and pushes the result back
      on the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  do* M.assign "x" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "y" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* [[ gas.charge_gas ~(|
    evm,
    gas.GAS_LOW
  |) ]] in
  do* M.assign "result" [[
    M.get_field ~(| M.get_local ~(| "x" |), "wrapping_mul" |) ~(|
      M.get_local ~(| "y" |)
    |) in
  ]] in
  do* [[ stack.push ~(|
    M.get_field ~(| evm, "stack" |),
    M.get_local ~(| "result" |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition div (evm : Evm) : M unit :=
  (*
      Integer division of the top two elements of the stack. Pushes the result
      back on the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  do* M.assign "dividend" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "divisor" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* [[ gas.charge_gas ~(|
    evm,
    gas.GAS_LOW
  |) ]] in
  (* TODO statement *)
  do* [[ stack.push ~(|
    M.get_field ~(| evm, "stack" |),
    M.get_local ~(| "quotient" |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition sdiv (evm : Evm) : M unit :=
  (*
      Signed integer division of the top two elements of the stack. Pushes the
      result back on the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  do* M.assign "dividend" [[
    M.get_field ~(| stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |), "to_signed" |) ~(|

    |) in
  ]] in
  do* M.assign "divisor" [[
    M.get_field ~(| stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |), "to_signed" |) ~(|

    |) in
  ]] in
  do* [[ gas.charge_gas ~(|
    evm,
    gas.GAS_LOW
  |) ]] in
  (* TODO statement *)
  do* [[ stack.push ~(|
    M.get_field ~(| evm, "stack" |),
    M.get_field ~(| ethereum_types.numeric.U256, "from_signed" |) ~(|
      M.get_local ~(| "quotient" |)
    |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition mod (evm : Evm) : M unit :=
  (*
      Modulo remainder of the top two elements of the stack. Pushes the result
      back on the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  do* M.assign "x" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "y" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* [[ gas.charge_gas ~(|
    evm,
    gas.GAS_LOW
  |) ]] in
  (* TODO statement *)
  do* [[ stack.push ~(|
    M.get_field ~(| evm, "stack" |),
    M.get_local ~(| "remainder" |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition smod (evm : Evm) : M unit :=
  (*
      Signed modulo remainder of the top two elements of the stack. Pushes the
      result back on the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  do* M.assign "x" [[
    M.get_field ~(| stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |), "to_signed" |) ~(|

    |) in
  ]] in
  do* M.assign "y" [[
    M.get_field ~(| stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |), "to_signed" |) ~(|

    |) in
  ]] in
  do* [[ gas.charge_gas ~(|
    evm,
    gas.GAS_LOW
  |) ]] in
  (* TODO statement *)
  do* [[ stack.push ~(|
    M.get_field ~(| evm, "stack" |),
    M.get_field ~(| ethereum_types.numeric.U256, "from_signed" |) ~(|
      M.get_local ~(| "remainder" |)
    |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition addmod (evm : Evm) : M unit :=
  (*
      Modulo addition of the top 2 elements with the 3rd element. Pushes the
      result back on the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  do* M.assign "x" [[
    ethereum_types.numeric.Uint ~(|
      stack.pop ~(|
        M.get_field ~(| evm, "stack" |)
      |)
    |) in
  ]] in
  do* M.assign "y" [[
    ethereum_types.numeric.Uint ~(|
      stack.pop ~(|
        M.get_field ~(| evm, "stack" |)
      |)
    |) in
  ]] in
  do* M.assign "z" [[
    ethereum_types.numeric.Uint ~(|
      stack.pop ~(|
        M.get_field ~(| evm, "stack" |)
      |)
    |) in
  ]] in
  do* [[ gas.charge_gas ~(|
    evm,
    gas.GAS_MID
  |) ]] in
  (* TODO statement *)
  do* [[ stack.push ~(|
    M.get_field ~(| evm, "stack" |),
    M.get_local ~(| "result" |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition mulmod (evm : Evm) : M unit :=
  (*
      Modulo multiplication of the top 2 elements with the 3rd element. Pushes
      the result back on the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  do* M.assign "x" [[
    ethereum_types.numeric.Uint ~(|
      stack.pop ~(|
        M.get_field ~(| evm, "stack" |)
      |)
    |) in
  ]] in
  do* M.assign "y" [[
    ethereum_types.numeric.Uint ~(|
      stack.pop ~(|
        M.get_field ~(| evm, "stack" |)
      |)
    |) in
  ]] in
  do* M.assign "z" [[
    ethereum_types.numeric.Uint ~(|
      stack.pop ~(|
        M.get_field ~(| evm, "stack" |)
      |)
    |) in
  ]] in
  do* [[ gas.charge_gas ~(|
    evm,
    gas.GAS_MID
  |) ]] in
  (* TODO statement *)
  do* [[ stack.push ~(|
    M.get_field ~(| evm, "stack" |),
    M.get_local ~(| "result" |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition exp (evm : Evm) : M unit :=
  (*
      Exponential operation of the top 2 elements. Pushes the result back on
      the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  do* M.assign "base" [[
    ethereum_types.numeric.Uint ~(|
      stack.pop ~(|
        M.get_field ~(| evm, "stack" |)
      |)
    |) in
  ]] in
  do* M.assign "exponent" [[
    ethereum_types.numeric.Uint ~(|
      stack.pop ~(|
        M.get_field ~(| evm, "stack" |)
      |)
    |) in
  ]] in
  do* M.assign "exponent_bits" [[
    M.get_field ~(| M.get_local ~(| "exponent" |), "bit_length" |) ~(|

    |) in
  ]] in
  do* M.assign "exponent_bytes" [[
    (* TODO expression *) in
  ]] in
  do* [[ gas.charge_gas ~(|
    evm,
    (* TODO expression *)
  |) ]] in
  do* M.assign "result" [[
    ethereum_types.numeric.U256 ~(|
      M.get_local ~(| "pow" |) ~(|
        M.get_local ~(| "base" |),
        M.get_local ~(| "exponent" |),
        (* TODO expression *)
      |)
    |) in
  ]] in
  do* [[ stack.push ~(|
    M.get_field ~(| evm, "stack" |),
    M.get_local ~(| "result" |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition signextend (evm : Evm) : M unit :=
  (*
      Sign extend operation. In other words, extend a signed number which
      fits in N bytes to 32 bytes.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  do* M.assign "byte_num" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "value" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* [[ gas.charge_gas ~(|
    evm,
    gas.GAS_LOW
  |) ]] in
  (* TODO statement *)
  do* [[ stack.push ~(|
    M.get_field ~(| evm, "stack" |),
    M.get_local ~(| "result" |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.
