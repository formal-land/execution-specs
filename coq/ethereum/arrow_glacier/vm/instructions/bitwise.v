(* Generated *)
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
Require ethereum.arrow_glacier.vm.__init__.
Require ethereum.arrow_glacier.vm.gas.
Require ethereum.arrow_glacier.vm.stack.

Definition bitwise_and (evm : Evm) : M unit :=
  (*
      Bitwise AND operation of the top 2 elements of the stack. Pushes the
      result back on the stack.

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
  do* [[ stack.push ~(|
    M.get_field ~(| evm, "stack" |),
    (* TODO expression *)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition bitwise_or (evm : Evm) : M unit :=
  (*
      Bitwise OR operation of the top 2 elements of the stack. Pushes the
      result back on the stack.

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
  do* [[ stack.push ~(|
    M.get_field ~(| evm, "stack" |),
    (* TODO expression *)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition bitwise_xor (evm : Evm) : M unit :=
  (*
      Bitwise XOR operation of the top 2 elements of the stack. Pushes the
      result back on the stack.

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
  do* [[ stack.push ~(|
    M.get_field ~(| evm, "stack" |),
    (* TODO expression *)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition bitwise_not (evm : Evm) : M unit :=
  (*
      Bitwise NOT operation of the top element of the stack. Pushes the
      result back on the stack.

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
  do* [[ gas.charge_gas ~(|
    evm,
    gas.GAS_VERY_LOW
  |) ]] in
  do* [[ stack.push ~(|
    M.get_field ~(| evm, "stack" |),
    (* TODO expression *)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition get_byte (evm : Evm) : M unit :=
  (*
      For a word (defined by next top element of the stack), retrieve the
      Nth byte (0-indexed and defined by top element of stack) from the
      left (most significant) to right (least significant).

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  do* M.assign "byte_index" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "word" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* [[ gas.charge_gas ~(|
    evm,
    gas.GAS_VERY_LOW
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

Definition bitwise_shl (evm : Evm) : M unit :=
  (*
      Logical shift left (SHL) operation of the top 2 elements of the stack.
      Pushes the result back on the stack.
      Parameters
      ----------
      evm :
          The current EVM frame.
      *)
  do* M.assign "shift" [[
    ethereum_types.numeric.Uint ~(|
      stack.pop ~(|
        M.get_field ~(| evm, "stack" |)
      |)
    |) in
  ]] in
  do* M.assign "value" [[
    ethereum_types.numeric.Uint ~(|
      stack.pop ~(|
        M.get_field ~(| evm, "stack" |)
      |)
    |) in
  ]] in
  do* [[ gas.charge_gas ~(|
    evm,
    gas.GAS_VERY_LOW
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

Definition bitwise_shr (evm : Evm) : M unit :=
  (*
      Logical shift right (SHR) operation of the top 2 elements of the stack.
      Pushes the result back on the stack.
      Parameters
      ----------
      evm :
          The current EVM frame.
      *)
  do* M.assign "shift" [[
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
    gas.GAS_VERY_LOW
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

Definition bitwise_sar (evm : Evm) : M unit :=
  (*
      Arithmetic shift right (SAR) operation of the top 2 elements of the stack.
      Pushes the result back on the stack.
      Parameters
      ----------
      evm :
          The current EVM frame.
      *)
  do* M.assign "shift" [[
    M.get_local ~(| "int" |) ~(|
      stack.pop ~(|
        M.get_field ~(| evm, "stack" |)
      |)
    |) in
  ]] in
  do* M.assign "signed_value" [[
    M.get_field ~(| stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |), "to_signed" |) ~(|

    |) in
  ]] in
  do* [[ gas.charge_gas ~(|
    evm,
    gas.GAS_VERY_LOW
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
