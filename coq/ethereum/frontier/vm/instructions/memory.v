(* Generated *)
(*
Ethereum Virtual Machine (EVM) Memory Instructions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Implementations of the EVM Memory instructions.
*)

Require ethereum_types.bytes.
Require ethereum_types.numeric.
Require ethereum.frontier.vm.__init__.
Require ethereum.frontier.vm.gas.
Require ethereum.frontier.vm.memory.
Require ethereum.frontier.vm.stack.

Definition mstore (evm : Evm) : M unit :=
  (*
      Stores a word to memory.
      This also expands the memory, if the memory is
      insufficient to store the word.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  do* M.assign "start_position" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "value" [[
    M.get_field ~(| stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |), "to_be_bytes32" |) ~(|

    |) in
  ]] in
  do* M.assign "extend_memory" [[
    gas.calculate_gas_extend_memory ~(|
      M.get_field ~(| evm, "memory" |),
      (* TODO expression *)
    |) in
  ]] in
  do* [[ gas.charge_gas ~(|
    evm,
    (* TODO expression *)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "memory" |) ]] [[
    (* TODO expression *)
  ]] in
  do* [[ memory.memory_write ~(|
    M.get_field ~(| evm, "memory" |),
    M.get_local ~(| "start_position" |),
    M.get_local ~(| "value" |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition mstore8 (evm : Evm) : M unit :=
  (*
      Stores a byte to memory.
      This also expands the memory, if the memory is
      insufficient to store the word.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  do* M.assign "start_position" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "value" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "extend_memory" [[
    gas.calculate_gas_extend_memory ~(|
      M.get_field ~(| evm, "memory" |),
      (* TODO expression *)
    |) in
  ]] in
  do* [[ gas.charge_gas ~(|
    evm,
    (* TODO expression *)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "memory" |) ]] [[
    (* TODO expression *)
  ]] in
  do* M.assign "normalized_bytes_value" [[
    ethereum_types.bytes.Bytes ~(|
      (* TODO expression *)
    |) in
  ]] in
  do* [[ memory.memory_write ~(|
    M.get_field ~(| evm, "memory" |),
    M.get_local ~(| "start_position" |),
    M.get_local ~(| "normalized_bytes_value" |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition mload (evm : Evm) : M unit :=
  (*
      Load word from memory.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  do* M.assign "start_position" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "extend_memory" [[
    gas.calculate_gas_extend_memory ~(|
      M.get_field ~(| evm, "memory" |),
      (* TODO expression *)
    |) in
  ]] in
  do* [[ gas.charge_gas ~(|
    evm,
    (* TODO expression *)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "memory" |) ]] [[
    (* TODO expression *)
  ]] in
  do* M.assign "value" [[
    M.get_field ~(| ethereum_types.numeric.U256, "from_be_bytes" |) ~(|
      memory.memory_read_bytes ~(|
        M.get_field ~(| evm, "memory" |),
        M.get_local ~(| "start_position" |),
        ethereum_types.numeric.U256 ~(|
          32
        |)
      |)
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

Definition msize (evm : Evm) : M unit :=
  (*
      Push the size of active memory in bytes onto the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  (* TODO statement *)
  do* [[ gas.charge_gas ~(|
    evm,
    gas.GAS_BASE
  |) ]] in
  do* [[ stack.push ~(|
    M.get_field ~(| evm, "stack" |),
    ethereum_types.numeric.U256 ~(|
      M.get_local ~(| "len" |) ~(|
        M.get_field ~(| evm, "memory" |)
      |)
    |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.
