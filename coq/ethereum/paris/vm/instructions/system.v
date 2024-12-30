(* Generated *)
(*
Ethereum Virtual Machine (EVM) System Instructions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Implementations of the EVM system related instructions.
*)

Require ethereum_types.bytes.
Require ethereum_types.numeric.
Require ethereum.utils.numeric.
Require ethereum.paris.fork_types.
Require ethereum.paris.state.
Require ethereum.paris.utils.address.
Require ethereum.paris.vm.__init__.
Require ethereum.paris.vm.exceptions.
Require ethereum.paris.vm.gas.
Require ethereum.paris.vm.memory.
Require ethereum.paris.vm.stack.

Definition generic_create (evm : Evm) (endowment : U256) (contract_address : Address) (memory_start_position : U256) (memory_size : U256) : M unit :=
  (*
      Core logic used by the `CREATE*` family of opcodes.
      *)
  (* TODO statement *)
  do* [[ M.get_field ~(| M.get_field ~(| evm, "accessed_addresses" |), "add" |) ~(|
    contract_address
  |) ]] in
  do* M.assign "create_message_gas" [[
    gas.max_message_call_gas ~(|
      ethereum_types.numeric.Uint ~(|
        M.get_field ~(| evm, "gas_left" |)
      |)
    |) in
  ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "gas_left" |) ]] [[
    M.get_local ~(| "create_message_gas" |)
  ]] in
  (* TODO statement *)
  (* TODO assignment *)
  do* M.assign "sender_address" [[
    M.get_field ~(| M.get_field ~(| evm, "message" |), "current_target" |) in
  ]] in
  do* M.assign "sender" [[
    state.get_account ~(|
      M.get_field ~(| M.get_field ~(| evm, "env" |), "state" |),
      M.get_local ~(| "sender_address" |)
    |) in
  ]] in
  (* TODO statement *)
  (* TODO statement *)
  do* M.assign "call_data" [[
    memory.memory_read_bytes ~(|
      M.get_field ~(| evm, "memory" |),
      memory_start_position,
      memory_size
    |) in
  ]] in
  do* [[ state.increment_nonce ~(|
    M.get_field ~(| M.get_field ~(| evm, "env" |), "state" |),
    M.get_field ~(| M.get_field ~(| evm, "message" |), "current_target" |)
  |) ]] in
  do* M.assign "child_message" [[
    __init__.Message ~(|

    |) in
  ]] in
  do* M.assign "child_evm" [[
    M.get_local ~(| "process_create_message" |) ~(|
      M.get_local ~(| "child_message" |),
      M.get_field ~(| evm, "env" |)
    |) in
  ]] in
  (* TODO statement *)
  M.pure tt.

Definition create (evm : Evm) : M unit :=
  (*
      Creates a new account with associated code.

      Parameters
      ----------
      evm :
          The current EVM frame.
      *)
  do* M.assign "endowment" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "memory_start_position" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "memory_size" [[
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
  do* M.assign "contract_address" [[
    utils.address.compute_contract_address ~(|
      M.get_field ~(| M.get_field ~(| evm, "message" |), "current_target" |),
      M.get_field ~(| state.get_account ~(|
        M.get_field ~(| M.get_field ~(| evm, "env" |), "state" |),
        M.get_field ~(| M.get_field ~(| evm, "message" |), "current_target" |)
      |), "nonce" |)
    |) in
  ]] in
  do* [[ M.get_local ~(| "generic_create" |) ~(|
    evm,
    M.get_local ~(| "endowment" |),
    M.get_local ~(| "contract_address" |),
    M.get_local ~(| "memory_start_position" |),
    M.get_local ~(| "memory_size" |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition create2 (evm : Evm) : M unit :=
  (*
      Creates a new account with associated code.

      It's similar to CREATE opcode except that the address of new account
      depends on the init_code instead of the nonce of sender.

      Parameters
      ----------
      evm :
          The current EVM frame.
      *)
  do* M.assign "endowment" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "memory_start_position" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "memory_size" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "salt" [[
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
  do* M.assign "call_data_words" [[
    (* TODO expression *) in
  ]] in
  do* [[ gas.charge_gas ~(|
    evm,
    (* TODO expression *)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "memory" |) ]] [[
    (* TODO expression *)
  ]] in
  do* M.assign "contract_address" [[
    utils.address.compute_create2_contract_address ~(|
      M.get_field ~(| M.get_field ~(| evm, "message" |), "current_target" |),
      M.get_local ~(| "salt" |),
      memory.memory_read_bytes ~(|
        M.get_field ~(| evm, "memory" |),
        M.get_local ~(| "memory_start_position" |),
        M.get_local ~(| "memory_size" |)
      |)
    |) in
  ]] in
  do* [[ M.get_local ~(| "generic_create" |) ~(|
    evm,
    M.get_local ~(| "endowment" |),
    M.get_local ~(| "contract_address" |),
    M.get_local ~(| "memory_start_position" |),
    M.get_local ~(| "memory_size" |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition return_ (evm : Evm) : M unit :=
  (*
      Halts execution returning output data.

      Parameters
      ----------
      evm :
          The current EVM frame.
      *)
  do* M.assign "memory_start_position" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "memory_size" [[
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
  (* TODO assignment *)
  (* TODO assignment *)
  (* TODO statement *)
  M.pure tt.

Definition generic_call (evm : Evm) (gas : Uint) (value : U256) (caller : Address) (to : Address) (code_address : Address) (should_transfer_value : bool) (is_staticcall : bool) (memory_input_start_position : U256) (memory_input_size : U256) (memory_output_start_position : U256) (memory_output_size : U256) : M unit :=
  (*
      Perform the core logic of the `CALL*` family of opcodes.
      *)
  (* TODO statement *)
  (* TODO assignment *)
  (* TODO statement *)
  do* M.assign "call_data" [[
    memory.memory_read_bytes ~(|
      M.get_field ~(| evm, "memory" |),
      memory_input_start_position,
      memory_input_size
    |) in
  ]] in
  do* M.assign "code" [[
    M.get_field ~(| state.get_account ~(|
      M.get_field ~(| M.get_field ~(| evm, "env" |), "state" |),
      code_address
    |), "code" |) in
  ]] in
  do* M.assign "child_message" [[
    __init__.Message ~(|

    |) in
  ]] in
  do* M.assign "child_evm" [[
    M.get_local ~(| "process_message" |) ~(|
      M.get_local ~(| "child_message" |),
      M.get_field ~(| evm, "env" |)
    |) in
  ]] in
  (* TODO statement *)
  do* M.assign "actual_output_size" [[
    M.get_local ~(| "min" |) ~(|
      memory_output_size,
      ethereum_types.numeric.U256 ~(|
        M.get_local ~(| "len" |) ~(|
          M.get_field ~(| M.get_local ~(| "child_evm" |), "output" |)
        |)
      |)
    |) in
  ]] in
  do* [[ memory.memory_write ~(|
    M.get_field ~(| evm, "memory" |),
    memory_output_start_position,
    (* TODO expression *)
  |) ]] in
  M.pure tt.

Definition call (evm : Evm) : M unit :=
  (*
      Message-call into an account.

      Parameters
      ----------
      evm :
          The current EVM frame.
      *)
  do* M.assign "gas" [[
    ethereum_types.numeric.Uint ~(|
      stack.pop ~(|
        M.get_field ~(| evm, "stack" |)
      |)
    |) in
  ]] in
  do* M.assign "to" [[
    utils.address.to_address ~(|
      stack.pop ~(|
        M.get_field ~(| evm, "stack" |)
      |)
    |) in
  ]] in
  do* M.assign "value" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "memory_input_start_position" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "memory_input_size" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "memory_output_start_position" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "memory_output_size" [[
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
  (* TODO statement *)
  do* M.assign "create_gas_cost" [[
    (* TODO expression *) in
  ]] in
  do* M.assign "transfer_gas_cost" [[
    (* TODO expression *) in
  ]] in
  do* M.assign "message_call_gas" [[
    gas.calculate_message_call_gas ~(|
      M.get_local ~(| "value" |),
      M.get_local ~(| "gas" |),
      ethereum_types.numeric.Uint ~(|
        M.get_field ~(| evm, "gas_left" |)
      |),
      M.get_field ~(| M.get_local ~(| "extend_memory" |), "cost" |),
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
  do* M.assign "sender_balance" [[
    M.get_field ~(| state.get_account ~(|
      M.get_field ~(| M.get_field ~(| evm, "env" |), "state" |),
      M.get_field ~(| M.get_field ~(| evm, "message" |), "current_target" |)
    |), "balance" |) in
  ]] in
  (* TODO statement *)
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition callcode (evm : Evm) : M unit :=
  (*
      Message-call into this account with alternative account’s code.

      Parameters
      ----------
      evm :
          The current EVM frame.
      *)
  do* M.assign "gas" [[
    ethereum_types.numeric.Uint ~(|
      stack.pop ~(|
        M.get_field ~(| evm, "stack" |)
      |)
    |) in
  ]] in
  do* M.assign "code_address" [[
    utils.address.to_address ~(|
      stack.pop ~(|
        M.get_field ~(| evm, "stack" |)
      |)
    |) in
  ]] in
  do* M.assign "value" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "memory_input_start_position" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "memory_input_size" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "memory_output_start_position" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "memory_output_size" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "to" [[
    M.get_field ~(| M.get_field ~(| evm, "message" |), "current_target" |) in
  ]] in
  do* M.assign "extend_memory" [[
    gas.calculate_gas_extend_memory ~(|
      M.get_field ~(| evm, "memory" |),
      (* TODO expression *)
    |) in
  ]] in
  (* TODO statement *)
  do* M.assign "transfer_gas_cost" [[
    (* TODO expression *) in
  ]] in
  do* M.assign "message_call_gas" [[
    gas.calculate_message_call_gas ~(|
      M.get_local ~(| "value" |),
      M.get_local ~(| "gas" |),
      ethereum_types.numeric.Uint ~(|
        M.get_field ~(| evm, "gas_left" |)
      |),
      M.get_field ~(| M.get_local ~(| "extend_memory" |), "cost" |),
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
  do* M.assign "sender_balance" [[
    M.get_field ~(| state.get_account ~(|
      M.get_field ~(| M.get_field ~(| evm, "env" |), "state" |),
      M.get_field ~(| M.get_field ~(| evm, "message" |), "current_target" |)
    |), "balance" |) in
  ]] in
  (* TODO statement *)
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition selfdestruct (evm : Evm) : M unit :=
  (*
      Halt execution and register account for later deletion.

      Parameters
      ----------
      evm :
          The current EVM frame.
      *)
  do* M.assign "beneficiary" [[
    utils.address.to_address ~(|
      stack.pop ~(|
        M.get_field ~(| evm, "stack" |)
      |)
    |) in
  ]] in
  do* M.assign "gas_cost" [[
    gas.GAS_SELF_DESTRUCT in
  ]] in
  (* TODO statement *)
  (* TODO statement *)
  do* [[ gas.charge_gas ~(|
    evm,
    M.get_local ~(| "gas_cost" |)
  |) ]] in
  (* TODO statement *)
  do* M.assign "originator" [[
    M.get_field ~(| M.get_field ~(| evm, "message" |), "current_target" |) in
  ]] in
  do* M.assign "beneficiary_balance" [[
    M.get_field ~(| state.get_account ~(|
      M.get_field ~(| M.get_field ~(| evm, "env" |), "state" |),
      M.get_local ~(| "beneficiary" |)
    |), "balance" |) in
  ]] in
  do* M.assign "originator_balance" [[
    M.get_field ~(| state.get_account ~(|
      M.get_field ~(| M.get_field ~(| evm, "env" |), "state" |),
      M.get_local ~(| "originator" |)
    |), "balance" |) in
  ]] in
  do* [[ state.set_account_balance ~(|
    M.get_field ~(| M.get_field ~(| evm, "env" |), "state" |),
    M.get_local ~(| "beneficiary" |),
    (* TODO expression *)
  |) ]] in
  do* [[ state.set_account_balance ~(|
    M.get_field ~(| M.get_field ~(| evm, "env" |), "state" |),
    M.get_local ~(| "originator" |),
    ethereum_types.numeric.U256 ~(|
      0
    |)
  |) ]] in
  do* [[ M.get_field ~(| M.get_field ~(| evm, "accounts_to_delete" |), "add" |) ~(|
    M.get_local ~(| "originator" |)
  |) ]] in
  (* TODO statement *)
  (* TODO assignment *)
  (* TODO statement *)
  M.pure tt.

Definition delegatecall (evm : Evm) : M unit :=
  (*
      Message-call into an account.

      Parameters
      ----------
      evm :
          The current EVM frame.
      *)
  do* M.assign "gas" [[
    ethereum_types.numeric.Uint ~(|
      stack.pop ~(|
        M.get_field ~(| evm, "stack" |)
      |)
    |) in
  ]] in
  do* M.assign "code_address" [[
    utils.address.to_address ~(|
      stack.pop ~(|
        M.get_field ~(| evm, "stack" |)
      |)
    |) in
  ]] in
  do* M.assign "memory_input_start_position" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "memory_input_size" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "memory_output_start_position" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "memory_output_size" [[
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
  (* TODO statement *)
  do* M.assign "message_call_gas" [[
    gas.calculate_message_call_gas ~(|
      ethereum_types.numeric.U256 ~(|
        0
      |),
      M.get_local ~(| "gas" |),
      ethereum_types.numeric.Uint ~(|
        M.get_field ~(| evm, "gas_left" |)
      |),
      M.get_field ~(| M.get_local ~(| "extend_memory" |), "cost" |),
      M.get_local ~(| "access_gas_cost" |)
    |) in
  ]] in
  do* [[ gas.charge_gas ~(|
    evm,
    (* TODO expression *)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "memory" |) ]] [[
    (* TODO expression *)
  ]] in
  do* [[ M.get_local ~(| "generic_call" |) ~(|
    evm,
    M.get_field ~(| M.get_local ~(| "message_call_gas" |), "stipend" |),
    M.get_field ~(| M.get_field ~(| evm, "message" |), "value" |),
    M.get_field ~(| M.get_field ~(| evm, "message" |), "caller" |),
    M.get_field ~(| M.get_field ~(| evm, "message" |), "current_target" |),
    M.get_local ~(| "code_address" |),
    False,
    False,
    M.get_local ~(| "memory_input_start_position" |),
    M.get_local ~(| "memory_input_size" |),
    M.get_local ~(| "memory_output_start_position" |),
    M.get_local ~(| "memory_output_size" |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition staticcall (evm : Evm) : M unit :=
  (*
      Message-call into an account.

      Parameters
      ----------
      evm :
          The current EVM frame.
      *)
  do* M.assign "gas" [[
    ethereum_types.numeric.Uint ~(|
      stack.pop ~(|
        M.get_field ~(| evm, "stack" |)
      |)
    |) in
  ]] in
  do* M.assign "to" [[
    utils.address.to_address ~(|
      stack.pop ~(|
        M.get_field ~(| evm, "stack" |)
      |)
    |) in
  ]] in
  do* M.assign "memory_input_start_position" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "memory_input_size" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "memory_output_start_position" [[
    stack.pop ~(|
      M.get_field ~(| evm, "stack" |)
    |) in
  ]] in
  do* M.assign "memory_output_size" [[
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
  (* TODO statement *)
  do* M.assign "message_call_gas" [[
    gas.calculate_message_call_gas ~(|
      ethereum_types.numeric.U256 ~(|
        0
      |),
      M.get_local ~(| "gas" |),
      ethereum_types.numeric.Uint ~(|
        M.get_field ~(| evm, "gas_left" |)
      |),
      M.get_field ~(| M.get_local ~(| "extend_memory" |), "cost" |),
      M.get_local ~(| "access_gas_cost" |)
    |) in
  ]] in
  do* [[ gas.charge_gas ~(|
    evm,
    (* TODO expression *)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "memory" |) ]] [[
    (* TODO expression *)
  ]] in
  do* [[ M.get_local ~(| "generic_call" |) ~(|
    evm,
    M.get_field ~(| M.get_local ~(| "message_call_gas" |), "stipend" |),
    ethereum_types.numeric.U256 ~(|
      0
    |),
    M.get_field ~(| M.get_field ~(| evm, "message" |), "current_target" |),
    M.get_local ~(| "to" |),
    M.get_local ~(| "to" |),
    True,
    True,
    M.get_local ~(| "memory_input_start_position" |),
    M.get_local ~(| "memory_input_size" |),
    M.get_local ~(| "memory_output_start_position" |),
    M.get_local ~(| "memory_output_size" |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition revert (evm : Evm) : M unit :=
  (*
      Stop execution and revert state changes, without consuming all provided gas
      and also has the ability to return a reason
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
  do* M.assign "size" [[
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
    M.get_field ~(| M.get_local ~(| "extend_memory" |), "cost" |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "memory" |) ]] [[
    (* TODO expression *)
  ]] in
  do* M.assign "output" [[
    memory.memory_read_bytes ~(|
      M.get_field ~(| evm, "memory" |),
      M.get_local ~(| "memory_start_index" |),
      M.get_local ~(| "size" |)
    |) in
  ]] in
  (* TODO assignment *)
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.
