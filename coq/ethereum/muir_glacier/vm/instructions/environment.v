(* Generated *)
(*
Ethereum Virtual Machine (EVM) Environmental Instructions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Implementations of the EVM environment related instructions.
*)

Require ethereum_types.numeric.
Require ethereum.crypto.hash.
Require ethereum.utils.numeric.
Require ethereum.muir_glacier.fork_types.
Require ethereum.muir_glacier.state.
Require ethereum.muir_glacier.utils.address.
Require ethereum.muir_glacier.vm.memory.
Require ethereum.muir_glacier.vm.__init__.
Require ethereum.muir_glacier.vm.exceptions.
Require ethereum.muir_glacier.vm.gas.
Require ethereum.muir_glacier.vm.stack.

Definition address (evm : Evm) : M unit :=
  (*
      Pushes the address of the current executing account to the stack.

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
    M.get_field ~(| ethereum_types.numeric.U256, "from_be_bytes" |) ~(|
      M.get_field ~(| M.get_field ~(| evm, "message" |), "current_target" |)
    |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition balance (evm : Evm) : M unit :=
  (*
      Pushes the balance of the given account onto the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  do* M.assign "address" [[
    utils.address.to_address ~(|
      stack.pop ~(|
        M.get_field ~(| evm, "stack" |)
      |)
    |) in
  ]] in
  do* [[ gas.charge_gas ~(|
    evm,
    gas.GAS_BALANCE
  |) ]] in
  do* M.assign "balance" [[
    M.get_field ~(| state.get_account ~(|
      M.get_field ~(| M.get_field ~(| evm, "env" |), "state" |),
      M.get_local ~(| "address" |)
    |), "balance" |) in
  ]] in
  do* [[ stack.push ~(|
    M.get_field ~(| evm, "stack" |),
    M.get_local ~(| "balance" |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition origin (evm : Evm) : M unit :=
  (*
      Pushes the address of the original transaction sender to the stack.
      The origin address can only be an EOA.

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
    M.get_field ~(| ethereum_types.numeric.U256, "from_be_bytes" |) ~(|
      M.get_field ~(| M.get_field ~(| evm, "env" |), "origin" |)
    |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition caller (evm : Evm) : M unit :=
  (*
      Pushes the address of the caller onto the stack.

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
    M.get_field ~(| ethereum_types.numeric.U256, "from_be_bytes" |) ~(|
      M.get_field ~(| M.get_field ~(| evm, "message" |), "caller" |)
    |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition callvalue (evm : Evm) : M unit :=
  (*
      Push the value (in wei) sent with the call onto the stack.

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
    M.get_field ~(| M.get_field ~(| evm, "message" |), "value" |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition calldataload (evm : Evm) : M unit :=
  (*
      Push a word (32 bytes) of the input data belonging to the current
      environment onto the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  do* M.assign "start_index" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* [[ gas.charge_gas ~(|
    evm,
    gas.GAS_VERY_LOW
  |) ]] in
  do* M.assign "value" [[
    vm.memory.buffer_read ~(|
      M.get_field ~(| M.get_field ~(| evm, "message" |), "data" |),
      M.get_local ~(| "start_index" |),
      ethereum_types.numeric.U256 ~(|
        32
      |)
    |) in
  ]] in
  do* [[ stack.push ~(|
    M.get_field ~(| evm, "stack" |),
    M.get_field ~(| ethereum_types.numeric.U256, "from_be_bytes" |) ~(|
      M.get_local ~(| "value" |)
    |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition calldatasize (evm : Evm) : M unit :=
  (*
      Push the size of input data in current environment onto the stack.

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
        M.get_field ~(| M.get_field ~(| evm, "message" |), "data" |)
      |)
    |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition calldatacopy (evm : Evm) : M unit :=
  (*
      Copy a portion of the input data in current environment to memory.

      This will also expand the memory, in case that the memory is insufficient
      to store the data.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  do* M.assign "memory_start_index" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "data_start_index" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "size" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "words" [[
    (* TODO expression *) in
  ]] in
  do* M.assign "copy_gas_cost" [[
    (* TODO expression *) in
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
    vm.memory.buffer_read ~(|
      M.get_field ~(| M.get_field ~(| evm, "message" |), "data" |),
      M.get_local ~(| "data_start_index" |),
      M.get_local ~(| "size" |)
    |) in
  ]] in
  do* [[ vm.memory.memory_write ~(|
    M.get_field ~(| evm, "memory" |),
    M.get_local ~(| "memory_start_index" |),
    M.get_local ~(| "value" |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition codesize (evm : Evm) : M unit :=
  (*
      Push the size of code running in current environment onto the stack.

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
        M.get_field ~(| evm, "code" |)
      |)
    |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition codecopy (evm : Evm) : M unit :=
  (*
      Copy a portion of the code in current environment to memory.

      This will also expand the memory, in case that the memory is insufficient
      to store the data.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  do* M.assign "memory_start_index" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "code_start_index" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "size" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "words" [[
    (* TODO expression *) in
  ]] in
  do* M.assign "copy_gas_cost" [[
    (* TODO expression *) in
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
    vm.memory.buffer_read ~(|
      M.get_field ~(| evm, "code" |),
      M.get_local ~(| "code_start_index" |),
      M.get_local ~(| "size" |)
    |) in
  ]] in
  do* [[ vm.memory.memory_write ~(|
    M.get_field ~(| evm, "memory" |),
    M.get_local ~(| "memory_start_index" |),
    M.get_local ~(| "value" |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition gasprice (evm : Evm) : M unit :=
  (*
      Push the gas price used in current environment onto the stack.

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
      M.get_field ~(| M.get_field ~(| evm, "env" |), "gas_price" |)
    |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition extcodesize (evm : Evm) : M unit :=
  (*
      Push the code size of a given account onto the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  do* M.assign "address" [[
    utils.address.to_address ~(|
      stack.pop ~(|
        M.get_field ~(| evm, "stack" |)
      |)
    |) in
  ]] in
  do* [[ gas.charge_gas ~(|
    evm,
    gas.GAS_EXTERNAL
  |) ]] in
  do* M.assign "codesize" [[
    ethereum_types.numeric.U256 ~(|
      M.get_local ~(| "len" |) ~(|
        M.get_field ~(| state.get_account ~(|
          M.get_field ~(| M.get_field ~(| evm, "env" |), "state" |),
          M.get_local ~(| "address" |)
        |), "code" |)
      |)
    |) in
  ]] in
  do* [[ stack.push ~(|
    M.get_field ~(| evm, "stack" |),
    M.get_local ~(| "codesize" |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition extcodecopy (evm : Evm) : M unit :=
  (*
      Copy a portion of an account's code to memory.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  do* M.assign "address" [[
    utils.address.to_address ~(|
      stack.pop ~(|
        M.get_field ~(| evm, "stack" |)
      |)
    |) in
  ]] in
  do* M.assign "memory_start_index" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "code_start_index" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "size" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "words" [[
    (* TODO expression *) in
  ]] in
  do* M.assign "copy_gas_cost" [[
    (* TODO expression *) in
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
  do* M.assign "code" [[
    M.get_field ~(| state.get_account ~(|
      M.get_field ~(| M.get_field ~(| evm, "env" |), "state" |),
      M.get_local ~(| "address" |)
    |), "code" |) in
  ]] in
  do* M.assign "value" [[
    vm.memory.buffer_read ~(|
      M.get_local ~(| "code" |),
      M.get_local ~(| "code_start_index" |),
      M.get_local ~(| "size" |)
    |) in
  ]] in
  do* [[ vm.memory.memory_write ~(|
    M.get_field ~(| evm, "memory" |),
    M.get_local ~(| "memory_start_index" |),
    M.get_local ~(| "value" |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition returndatasize (evm : Evm) : M unit :=
  (*
      Pushes the size of the return data buffer onto the stack.

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
        M.get_field ~(| evm, "return_data" |)
      |)
    |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition returndatacopy (evm : Evm) : M unit :=
  (*
      Copies data from the return data buffer code to memory

      Parameters
      ----------
      evm :
          The current EVM frame.
      *)
  do* M.assign "memory_start_index" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "return_data_start_position" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "size" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "words" [[
    (* TODO expression *) in
  ]] in
  do* M.assign "copy_gas_cost" [[
    (* TODO expression *) in
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
  (* TODO statement *)
  do* M.aug_assign [[ M.get_field ~(| evm, "memory" |) ]] [[
    (* TODO expression *)
  ]] in
  do* M.assign "value" [[
    (* TODO expression *) in
  ]] in
  do* [[ vm.memory.memory_write ~(|
    M.get_field ~(| evm, "memory" |),
    M.get_local ~(| "memory_start_index" |),
    M.get_local ~(| "value" |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition extcodehash (evm : Evm) : M unit :=
  (*
      Returns the keccak256 hash of a contract’s bytecode
      Parameters
      ----------
      evm :
          The current EVM frame.
      *)
  do* M.assign "address" [[
    utils.address.to_address ~(|
      stack.pop ~(|
        M.get_field ~(| evm, "stack" |)
      |)
    |) in
  ]] in
  do* [[ gas.charge_gas ~(|
    evm,
    gas.GAS_CODE_HASH
  |) ]] in
  do* M.assign "account" [[
    state.get_account ~(|
      M.get_field ~(| M.get_field ~(| evm, "env" |), "state" |),
      M.get_local ~(| "address" |)
    |) in
  ]] in
  (* TODO statement *)
  do* [[ stack.push ~(|
    M.get_field ~(| evm, "stack" |),
    M.get_local ~(| "codehash" |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition self_balance (evm : Evm) : M unit :=
  (*
      Pushes the balance of the current address to the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  (* TODO statement *)
  do* [[ gas.charge_gas ~(|
    evm,
    gas.GAS_FAST_STEP
  |) ]] in
  do* M.assign "balance" [[
    M.get_field ~(| state.get_account ~(|
      M.get_field ~(| M.get_field ~(| evm, "env" |), "state" |),
      M.get_field ~(| M.get_field ~(| evm, "message" |), "current_target" |)
    |), "balance" |) in
  ]] in
  do* [[ stack.push ~(|
    M.get_field ~(| evm, "stack" |),
    M.get_local ~(| "balance" |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.
