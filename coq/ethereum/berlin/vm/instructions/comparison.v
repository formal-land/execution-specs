(* Generated *)
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
Require ethereum.berlin.vm.__init__.
Require ethereum.berlin.vm.gas.
Require ethereum.berlin.vm.stack.

Definition less_than (evm : Evm) : M unit :=
  (*
      Checks if the top element is less than the next top element. Pushes the
      result back on the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  do* M.assign "left" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "right" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* [[ gas.charge_gas ~(|
    evm,
    gas.GAS_VERY_LOW
  |) ]] in
  do* M.assign "result" [[
    ethereum_types.numeric.U256 ~(|
      (* TODO expression *)
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

Definition signed_less_than (evm : Evm) : M unit :=
  (*
      Signed less-than comparison.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  do* M.assign "left" [[
    M.get_field ~(| stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |), "to_signed" |) ~(|

    |) in
  ]] in
  do* M.assign "right" [[
    M.get_field ~(| stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |), "to_signed" |) ~(|

    |) in
  ]] in
  do* [[ gas.charge_gas ~(|
    evm,
    gas.GAS_VERY_LOW
  |) ]] in
  do* M.assign "result" [[
    ethereum_types.numeric.U256 ~(|
      (* TODO expression *)
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

Definition greater_than (evm : Evm) : M unit :=
  (*
      Checks if the top element is greater than the next top element. Pushes
      the result back on the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  do* M.assign "left" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "right" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* [[ gas.charge_gas ~(|
    evm,
    gas.GAS_VERY_LOW
  |) ]] in
  do* M.assign "result" [[
    ethereum_types.numeric.U256 ~(|
      (* TODO expression *)
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

Definition signed_greater_than (evm : Evm) : M unit :=
  (*
      Signed greater-than comparison.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  do* M.assign "left" [[
    M.get_field ~(| stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |), "to_signed" |) ~(|

    |) in
  ]] in
  do* M.assign "right" [[
    M.get_field ~(| stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |), "to_signed" |) ~(|

    |) in
  ]] in
  do* [[ gas.charge_gas ~(|
    evm,
    gas.GAS_VERY_LOW
  |) ]] in
  do* M.assign "result" [[
    ethereum_types.numeric.U256 ~(|
      (* TODO expression *)
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

Definition equal (evm : Evm) : M unit :=
  (*
      Checks if the top element is equal to the next top element. Pushes
      the result back on the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  do* M.assign "left" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "right" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* [[ gas.charge_gas ~(|
    evm,
    gas.GAS_VERY_LOW
  |) ]] in
  do* M.assign "result" [[
    ethereum_types.numeric.U256 ~(|
      (* TODO expression *)
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

Definition is_zero (evm : Evm) : M unit :=
  (*
      Checks if the top element is equal to 0. Pushes the result back on the
      stack.

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
  do* M.assign "result" [[
    ethereum_types.numeric.U256 ~(|
      (* TODO expression *)
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
