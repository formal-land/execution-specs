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
Require dao_fork.fork_types.
Require dao_fork.state.
Require dao_fork.utils.address.
Require dao_fork.vm.gas.
Require dao_fork.vm.memory.
Require dao_fork.vm.stack.

Definition create : M unit :=
  (*
      Creates a new account with associated code.

      Parameters
      ----------
      evm :
          The current EVM frame.
      *)
  (* TODO statement *)
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
  let* create_message_gas := evm.["gas_left"] in
  (* TODO assignment *)
  (* TODO statement *)
  let* sender_address := evm.["message"].["current_target"] in
  let* sender := state.get_account (|
    evm.["env"].["state"],
    sender_address
  |) in
  let* contract_address := utils.address.compute_contract_address (|
    evm.["message"].["current_target"],
    state.get_account (|
      evm.["env"].["state"],
      evm.["message"].["current_target"]
    |).["nonce"]
  |) in
  (* TODO statement *)
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
  let* message_call_gas := gas.calculate_message_call_gas (|
    evm.["env"].["state"],
    gas,
    to,
    value
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
  let* message_call_gas := gas.calculate_message_call_gas (|
    evm.["env"].["state"],
    gas,
    to,
    value
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
  let* gas_cost := gas.GAS_ZERO in
  let* originator := evm.["message"].["current_target"] in
  let* refunded_accounts := evm.["accounts_to_delete"] in
  let* parent_evm := evm.["message"].["parent_evm"] in
  (* TODO statement *)
  (* TODO statement *)
  do* gas.charge_gas (|
    evm,
    gas_cost
  |) in
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
  do* gas.charge_gas (|
    evm,
    (* TODO expression *)
  |) in
  (* TODO statement *)
  do* generic_call (|
    evm,
    gas,
    evm.["message"].["value"],
    evm.["message"].["caller"],
    evm.["message"].["current_target"],
    code_address,
    (* TODO expression *),
    memory_input_start_position,
    memory_input_size,
    memory_output_start_position,
    memory_output_size
  |) in
  (* TODO statement *)

