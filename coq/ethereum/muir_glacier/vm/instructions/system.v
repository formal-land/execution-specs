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
Require muir_glacier.fork_types.
Require muir_glacier.state.
Require muir_glacier.utils.address.
Require muir_glacier.vm.exceptions.
Require muir_glacier.vm.gas.
Require muir_glacier.vm.memory.
Require muir_glacier.vm.stack.

Definition generic_create : M unit :=
  (*
      Core logic used by the `CREATE*` family of opcodes.
      *)
  (* TODO statement *)
  let* create_message_gas := gas.max_message_call_gas (|
    ethereum_types.numeric.Uint (|
      evm.["gas_left"]
    |)
  |) in
  (* TODO statement *)
  (* TODO statement *)
  (* TODO assignment *)
  let* sender_address := evm.["message"].["current_target"] in
  let* sender := state.get_account (|
    evm.["env"].["state"],
    sender_address
  |) in
  (* TODO statement *)
  (* TODO statement *)
  let* call_data := memory.memory_read_bytes (|
    evm.["memory"],
    memory_start_position,
    memory_size
  |) in
  do* state.increment_nonce (|
    evm.["env"].["state"],
    evm.["message"].["current_target"]
  |) in
  let* child_message := Message (|

  |) in
  let* child_evm := process_create_message (|
    child_message,
    evm.["env"]
  |) in
  (* TODO statement *)


Definition create : M unit :=
  (*
      Creates a new account with associated code.

      Parameters
      ----------
      evm :
          The current EVM frame.
      *)
  let* endowment := stack.pop (|
    evm.["stack"]
  |) in
  let* memory_start_position := stack.pop (|
    evm.["stack"]
  |) in
  let* memory_size := stack.pop (|
    evm.["stack"]
  |) in
  let* extend_memory := gas.calculate_gas_extend_memory (|
    evm.["memory"],
    (* TODO expression *)
  |) in
  do* gas.charge_gas (|
    evm,
    (* TODO expression *)
  |) in
  (* TODO statement *)
  let* contract_address := utils.address.compute_contract_address (|
    evm.["message"].["current_target"],
    state.get_account (|
      evm.["env"].["state"],
      evm.["message"].["current_target"]
    |).["nonce"]
  |) in
  do* generic_create (|
    evm,
    endowment,
    contract_address,
    memory_start_position,
    memory_size
  |) in
  (* TODO statement *)


Definition create2 : M unit :=
  (*
      Creates a new account with associated code.

      It's similar to CREATE opcode except that the address of new account
      depends on the init_code instead of the nonce of sender.

      Parameters
      ----------
      evm :
          The current EVM frame.
      *)
  let* endowment := stack.pop (|
    evm.["stack"]
  |) in
  let* memory_start_position := stack.pop (|
    evm.["stack"]
  |) in
  let* memory_size := stack.pop (|
    evm.["stack"]
  |) in
  let* salt := stack.pop (|
    evm.["stack"]
  |).["to_be_bytes32"] (|

  |) in
  let* extend_memory := gas.calculate_gas_extend_memory (|
    evm.["memory"],
    (* TODO expression *)
  |) in
  let* call_data_words := (* TODO expression *) in
  do* gas.charge_gas (|
    evm,
    (* TODO expression *)
  |) in
  (* TODO statement *)
  let* contract_address := utils.address.compute_create2_contract_address (|
    evm.["message"].["current_target"],
    salt,
    memory.memory_read_bytes (|
      evm.["memory"],
      memory_start_position,
      memory_size
    |)
  |) in
  do* generic_create (|
    evm,
    endowment,
    contract_address,
    memory_start_position,
    memory_size
  |) in
  (* TODO statement *)


Definition return_ : M unit :=
  (*
      Halts execution returning output data.

      Parameters
      ----------
      evm :
          The current EVM frame.
      *)
  let* memory_start_position := stack.pop (|
    evm.["stack"]
  |) in
  let* memory_size := stack.pop (|
    evm.["stack"]
  |) in
  let* extend_memory := gas.calculate_gas_extend_memory (|
    evm.["memory"],
    (* TODO expression *)
  |) in
  do* gas.charge_gas (|
    evm,
    (* TODO expression *)
  |) in
  (* TODO statement *)
  (* TODO assignment *)
  (* TODO assignment *)
  (* TODO statement *)


Definition generic_call : M unit :=
  (*
      Perform the core logic of the `CALL*` family of opcodes.
      *)
  (* TODO statement *)
  (* TODO assignment *)
  (* TODO statement *)
  let* call_data := memory.memory_read_bytes (|
    evm.["memory"],
    memory_input_start_position,
    memory_input_size
  |) in
  let* code := state.get_account (|
    evm.["env"].["state"],
    code_address
  |).["code"] in
  let* child_message := Message (|

  |) in
  let* child_evm := process_message (|
    child_message,
    evm.["env"]
  |) in
  (* TODO statement *)
  let* actual_output_size := min (|
    memory_output_size,
    ethereum_types.numeric.U256 (|
      len (|
        child_evm.["output"]
      |)
    |)
  |) in
  do* memory.memory_write (|
    evm.["memory"],
    memory_output_start_position,
    (* TODO expression *)
  |) in


Definition call : M unit :=
  (*
      Message-call into an account.

      Parameters
      ----------
      evm :
          The current EVM frame.
      *)
  let* gas := ethereum_types.numeric.Uint (|
    stack.pop (|
      evm.["stack"]
    |)
  |) in
  let* to := utils.address.to_address (|
    stack.pop (|
      evm.["stack"]
    |)
  |) in
  let* value := stack.pop (|
    evm.["stack"]
  |) in
  let* memory_input_start_position := stack.pop (|
    evm.["stack"]
  |) in
  let* memory_input_size := stack.pop (|
    evm.["stack"]
  |) in
  let* memory_output_start_position := stack.pop (|
    evm.["stack"]
  |) in
  let* memory_output_size := stack.pop (|
    evm.["stack"]
  |) in
  let* extend_memory := gas.calculate_gas_extend_memory (|
    evm.["memory"],
    (* TODO expression *)
  |) in
  let* create_gas_cost := (* TODO expression *) in
  let* transfer_gas_cost := (* TODO expression *) in
  let* message_call_gas := gas.calculate_message_call_gas (|
    value,
    gas,
    ethereum_types.numeric.Uint (|
      evm.["gas_left"]
    |),
    extend_memory.["cost"],
    (* TODO expression *)
  |) in
  do* gas.charge_gas (|
    evm,
    (* TODO expression *)
  |) in
  (* TODO statement *)
  (* TODO statement *)
  let* sender_balance := state.get_account (|
    evm.["env"].["state"],
    evm.["message"].["current_target"]
  |).["balance"] in
  (* TODO statement *)
  (* TODO statement *)


Definition callcode : M unit :=
  (*
      Message-call into this account with alternative account’s code.

      Parameters
      ----------
      evm :
          The current EVM frame.
      *)
  let* gas := ethereum_types.numeric.Uint (|
    stack.pop (|
      evm.["stack"]
    |)
  |) in
  let* code_address := utils.address.to_address (|
    stack.pop (|
      evm.["stack"]
    |)
  |) in
  let* value := stack.pop (|
    evm.["stack"]
  |) in
  let* memory_input_start_position := stack.pop (|
    evm.["stack"]
  |) in
  let* memory_input_size := stack.pop (|
    evm.["stack"]
  |) in
  let* memory_output_start_position := stack.pop (|
    evm.["stack"]
  |) in
  let* memory_output_size := stack.pop (|
    evm.["stack"]
  |) in
  let* to := evm.["message"].["current_target"] in
  let* extend_memory := gas.calculate_gas_extend_memory (|
    evm.["memory"],
    (* TODO expression *)
  |) in
  let* transfer_gas_cost := (* TODO expression *) in
  let* message_call_gas := gas.calculate_message_call_gas (|
    value,
    gas,
    ethereum_types.numeric.Uint (|
      evm.["gas_left"]
    |),
    extend_memory.["cost"],
    (* TODO expression *)
  |) in
  do* gas.charge_gas (|
    evm,
    (* TODO expression *)
  |) in
  (* TODO statement *)
  let* sender_balance := state.get_account (|
    evm.["env"].["state"],
    evm.["message"].["current_target"]
  |).["balance"] in
  (* TODO statement *)
  (* TODO statement *)


Definition selfdestruct : M unit :=
  (*
      Halt execution and register account for later deletion.

      Parameters
      ----------
      evm :
          The current EVM frame.
      *)
  let* beneficiary := utils.address.to_address (|
    stack.pop (|
      evm.["stack"]
    |)
  |) in
  let* gas_cost := gas.GAS_SELF_DESTRUCT in
  (* TODO statement *)
  let* originator := evm.["message"].["current_target"] in
  let* refunded_accounts := evm.["accounts_to_delete"] in
  let* parent_evm := evm.["message"].["parent_evm"] in
  (* TODO statement *)
  (* TODO statement *)
  do* gas.charge_gas (|
    evm,
    gas_cost
  |) in
  (* TODO statement *)
  let* beneficiary_balance := state.get_account (|
    evm.["env"].["state"],
    beneficiary
  |).["balance"] in
  let* originator_balance := state.get_account (|
    evm.["env"].["state"],
    originator
  |).["balance"] in
  do* state.set_account_balance (|
    evm.["env"].["state"],
    beneficiary,
    (* TODO expression *)
  |) in
  do* state.set_account_balance (|
    evm.["env"].["state"],
    originator,
    ethereum_types.numeric.U256 (|
      (* TODO expression *)
    |)
  |) in
  do* evm.["accounts_to_delete"].["add"] (|
    originator
  |) in
  (* TODO statement *)
  (* TODO assignment *)
  (* TODO statement *)


Definition delegatecall : M unit :=
  (*
      Message-call into an account.

      Parameters
      ----------
      evm :
          The current EVM frame.
      *)
  let* gas := ethereum_types.numeric.Uint (|
    stack.pop (|
      evm.["stack"]
    |)
  |) in
  let* code_address := utils.address.to_address (|
    stack.pop (|
      evm.["stack"]
    |)
  |) in
  let* memory_input_start_position := stack.pop (|
    evm.["stack"]
  |) in
  let* memory_input_size := stack.pop (|
    evm.["stack"]
  |) in
  let* memory_output_start_position := stack.pop (|
    evm.["stack"]
  |) in
  let* memory_output_size := stack.pop (|
    evm.["stack"]
  |) in
  let* extend_memory := gas.calculate_gas_extend_memory (|
    evm.["memory"],
    (* TODO expression *)
  |) in
  let* message_call_gas := gas.calculate_message_call_gas (|
    ethereum_types.numeric.U256 (|
      (* TODO expression *)
    |),
    gas,
    ethereum_types.numeric.Uint (|
      evm.["gas_left"]
    |),
    extend_memory.["cost"],
    gas.GAS_CALL
  |) in
  do* gas.charge_gas (|
    evm,
    (* TODO expression *)
  |) in
  (* TODO statement *)
  do* generic_call (|
    evm,
    message_call_gas.["stipend"],
    evm.["message"].["value"],
    evm.["message"].["caller"],
    evm.["message"].["current_target"],
    code_address,
    (* TODO expression *),
    (* TODO expression *),
    memory_input_start_position,
    memory_input_size,
    memory_output_start_position,
    memory_output_size
  |) in
  (* TODO statement *)


Definition staticcall : M unit :=
  (*
      Message-call into an account.

      Parameters
      ----------
      evm :
          The current EVM frame.
      *)
  let* gas := ethereum_types.numeric.Uint (|
    stack.pop (|
      evm.["stack"]
    |)
  |) in
  let* to := utils.address.to_address (|
    stack.pop (|
      evm.["stack"]
    |)
  |) in
  let* memory_input_start_position := stack.pop (|
    evm.["stack"]
  |) in
  let* memory_input_size := stack.pop (|
    evm.["stack"]
  |) in
  let* memory_output_start_position := stack.pop (|
    evm.["stack"]
  |) in
  let* memory_output_size := stack.pop (|
    evm.["stack"]
  |) in
  let* extend_memory := gas.calculate_gas_extend_memory (|
    evm.["memory"],
    (* TODO expression *)
  |) in
  let* message_call_gas := gas.calculate_message_call_gas (|
    ethereum_types.numeric.U256 (|
      (* TODO expression *)
    |),
    gas,
    ethereum_types.numeric.Uint (|
      evm.["gas_left"]
    |),
    extend_memory.["cost"],
    gas.GAS_CALL
  |) in
  do* gas.charge_gas (|
    evm,
    (* TODO expression *)
  |) in
  (* TODO statement *)
  do* generic_call (|
    evm,
    message_call_gas.["stipend"],
    ethereum_types.numeric.U256 (|
      (* TODO expression *)
    |),
    evm.["message"].["current_target"],
    to,
    to,
    (* TODO expression *),
    (* TODO expression *),
    memory_input_start_position,
    memory_input_size,
    memory_output_start_position,
    memory_output_size
  |) in
  (* TODO statement *)


Definition revert : M unit :=
  (*
      Stop execution and revert state changes, without consuming all provided gas
      and also has the ability to return a reason
      Parameters
      ----------
      evm :
          The current EVM frame.
      *)
  let* memory_start_index := stack.pop (|
    evm.["stack"]
  |) in
  let* size := stack.pop (|
    evm.["stack"]
  |) in
  let* extend_memory := gas.calculate_gas_extend_memory (|
    evm.["memory"],
    (* TODO expression *)
  |) in
  do* gas.charge_gas (|
    evm,
    extend_memory.["cost"]
  |) in
  (* TODO statement *)
  let* output := memory.memory_read_bytes (|
    evm.["memory"],
    memory_start_index,
    size
  |) in
  (* TODO assignment *)
  (* TODO statement *)
  (* TODO statement *)

