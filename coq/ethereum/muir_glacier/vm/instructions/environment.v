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
Require muir_glacier.fork_types.
Require muir_glacier.state.
Require muir_glacier.utils.address.
Require muir_glacier.vm.memory.
Require muir_glacier.vm.exceptions.
Require muir_glacier.vm.gas.
Require muir_glacier.vm.stack.

Definition address : M unit :=
  (*
      Pushes the address of the current executing account to the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  (* TODO statement *)
  do* gas.charge_gas (|
    evm,
    gas.GAS_BASE
  |) in
  do* stack.push (|
    evm.["stack"],
    ethereum_types.numeric.U256.["from_be_bytes"] (|
      evm.["message"].["current_target"]
    |)
  |) in
  (* TODO statement *)


Definition balance : M unit :=
  (*
      Pushes the balance of the given account onto the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  let* address := utils.address.to_address (|
    stack.pop (|
      evm.["stack"]
    |)
  |) in
  do* gas.charge_gas (|
    evm,
    gas.GAS_BALANCE
  |) in
  let* balance := state.get_account (|
    evm.["env"].["state"],
    address
  |).["balance"] in
  do* stack.push (|
    evm.["stack"],
    balance
  |) in
  (* TODO statement *)


Definition origin : M unit :=
  (*
      Pushes the address of the original transaction sender to the stack.
      The origin address can only be an EOA.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  (* TODO statement *)
  do* gas.charge_gas (|
    evm,
    gas.GAS_BASE
  |) in
  do* stack.push (|
    evm.["stack"],
    ethereum_types.numeric.U256.["from_be_bytes"] (|
      evm.["env"].["origin"]
    |)
  |) in
  (* TODO statement *)


Definition caller : M unit :=
  (*
      Pushes the address of the caller onto the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  (* TODO statement *)
  do* gas.charge_gas (|
    evm,
    gas.GAS_BASE
  |) in
  do* stack.push (|
    evm.["stack"],
    ethereum_types.numeric.U256.["from_be_bytes"] (|
      evm.["message"].["caller"]
    |)
  |) in
  (* TODO statement *)


Definition callvalue : M unit :=
  (*
      Push the value (in wei) sent with the call onto the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  (* TODO statement *)
  do* gas.charge_gas (|
    evm,
    gas.GAS_BASE
  |) in
  do* stack.push (|
    evm.["stack"],
    evm.["message"].["value"]
  |) in
  (* TODO statement *)


Definition calldataload : M unit :=
  (*
      Push a word (32 bytes) of the input data belonging to the current
      environment onto the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  let* start_index := stack.pop (|
    evm.["stack"]
  |) in
  do* gas.charge_gas (|
    evm,
    gas.GAS_VERY_LOW
  |) in
  let* value := vm.memory.buffer_read (|
    evm.["message"].["data"],
    start_index,
    ethereum_types.numeric.U256 (|
      (* TODO expression *)
    |)
  |) in
  do* stack.push (|
    evm.["stack"],
    ethereum_types.numeric.U256.["from_be_bytes"] (|
      value
    |)
  |) in
  (* TODO statement *)


Definition calldatasize : M unit :=
  (*
      Push the size of input data in current environment onto the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  (* TODO statement *)
  do* gas.charge_gas (|
    evm,
    gas.GAS_BASE
  |) in
  do* stack.push (|
    evm.["stack"],
    ethereum_types.numeric.U256 (|
      len (|
        evm.["message"].["data"]
      |)
    |)
  |) in
  (* TODO statement *)


Definition calldatacopy : M unit :=
  (*
      Copy a portion of the input data in current environment to memory.

      This will also expand the memory, in case that the memory is insufficient
      to store the data.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  let* memory_start_index := stack.pop (|
    evm.["stack"]
  |) in
  let* data_start_index := stack.pop (|
    evm.["stack"]
  |) in
  let* size := stack.pop (|
    evm.["stack"]
  |) in
  let* words := (* TODO expression *) in
  let* copy_gas_cost := (* TODO expression *) in
  let* extend_memory := gas.calculate_gas_extend_memory (|
    evm.["memory"],
    (* TODO expression *)
  |) in
  do* gas.charge_gas (|
    evm,
    (* TODO expression *)
  |) in
  (* TODO statement *)
  let* value := vm.memory.buffer_read (|
    evm.["message"].["data"],
    data_start_index,
    size
  |) in
  do* vm.memory.memory_write (|
    evm.["memory"],
    memory_start_index,
    value
  |) in
  (* TODO statement *)


Definition codesize : M unit :=
  (*
      Push the size of code running in current environment onto the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  (* TODO statement *)
  do* gas.charge_gas (|
    evm,
    gas.GAS_BASE
  |) in
  do* stack.push (|
    evm.["stack"],
    ethereum_types.numeric.U256 (|
      len (|
        evm.["code"]
      |)
    |)
  |) in
  (* TODO statement *)


Definition codecopy : M unit :=
  (*
      Copy a portion of the code in current environment to memory.

      This will also expand the memory, in case that the memory is insufficient
      to store the data.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  let* memory_start_index := stack.pop (|
    evm.["stack"]
  |) in
  let* code_start_index := stack.pop (|
    evm.["stack"]
  |) in
  let* size := stack.pop (|
    evm.["stack"]
  |) in
  let* words := (* TODO expression *) in
  let* copy_gas_cost := (* TODO expression *) in
  let* extend_memory := gas.calculate_gas_extend_memory (|
    evm.["memory"],
    (* TODO expression *)
  |) in
  do* gas.charge_gas (|
    evm,
    (* TODO expression *)
  |) in
  (* TODO statement *)
  let* value := vm.memory.buffer_read (|
    evm.["code"],
    code_start_index,
    size
  |) in
  do* vm.memory.memory_write (|
    evm.["memory"],
    memory_start_index,
    value
  |) in
  (* TODO statement *)


Definition gasprice : M unit :=
  (*
      Push the gas price used in current environment onto the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  (* TODO statement *)
  do* gas.charge_gas (|
    evm,
    gas.GAS_BASE
  |) in
  do* stack.push (|
    evm.["stack"],
    ethereum_types.numeric.U256 (|
      evm.["env"].["gas_price"]
    |)
  |) in
  (* TODO statement *)


Definition extcodesize : M unit :=
  (*
      Push the code size of a given account onto the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  let* address := utils.address.to_address (|
    stack.pop (|
      evm.["stack"]
    |)
  |) in
  do* gas.charge_gas (|
    evm,
    gas.GAS_EXTERNAL
  |) in
  let* codesize := ethereum_types.numeric.U256 (|
    len (|
      state.get_account (|
        evm.["env"].["state"],
        address
      |).["code"]
    |)
  |) in
  do* stack.push (|
    evm.["stack"],
    codesize
  |) in
  (* TODO statement *)


Definition extcodecopy : M unit :=
  (*
      Copy a portion of an account's code to memory.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  let* address := utils.address.to_address (|
    stack.pop (|
      evm.["stack"]
    |)
  |) in
  let* memory_start_index := stack.pop (|
    evm.["stack"]
  |) in
  let* code_start_index := stack.pop (|
    evm.["stack"]
  |) in
  let* size := stack.pop (|
    evm.["stack"]
  |) in
  let* words := (* TODO expression *) in
  let* copy_gas_cost := (* TODO expression *) in
  let* extend_memory := gas.calculate_gas_extend_memory (|
    evm.["memory"],
    (* TODO expression *)
  |) in
  do* gas.charge_gas (|
    evm,
    (* TODO expression *)
  |) in
  (* TODO statement *)
  let* code := state.get_account (|
    evm.["env"].["state"],
    address
  |).["code"] in
  let* value := vm.memory.buffer_read (|
    code,
    code_start_index,
    size
  |) in
  do* vm.memory.memory_write (|
    evm.["memory"],
    memory_start_index,
    value
  |) in
  (* TODO statement *)


Definition returndatasize : M unit :=
  (*
      Pushes the size of the return data buffer onto the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.
      *)
  (* TODO statement *)
  do* gas.charge_gas (|
    evm,
    gas.GAS_BASE
  |) in
  do* stack.push (|
    evm.["stack"],
    ethereum_types.numeric.U256 (|
      len (|
        evm.["return_data"]
      |)
    |)
  |) in
  (* TODO statement *)


Definition returndatacopy : M unit :=
  (*
      Copies data from the return data buffer code to memory

      Parameters
      ----------
      evm :
          The current EVM frame.
      *)
  let* memory_start_index := stack.pop (|
    evm.["stack"]
  |) in
  let* return_data_start_position := stack.pop (|
    evm.["stack"]
  |) in
  let* size := stack.pop (|
    evm.["stack"]
  |) in
  let* words := (* TODO expression *) in
  let* copy_gas_cost := (* TODO expression *) in
  let* extend_memory := gas.calculate_gas_extend_memory (|
    evm.["memory"],
    (* TODO expression *)
  |) in
  do* gas.charge_gas (|
    evm,
    (* TODO expression *)
  |) in
  (* TODO statement *)
  (* TODO statement *)
  let* value := (* TODO expression *) in
  do* vm.memory.memory_write (|
    evm.["memory"],
    memory_start_index,
    value
  |) in
  (* TODO statement *)


Definition extcodehash : M unit :=
  (*
      Returns the keccak256 hash of a contract’s bytecode
      Parameters
      ----------
      evm :
          The current EVM frame.
      *)
  let* address := utils.address.to_address (|
    stack.pop (|
      evm.["stack"]
    |)
  |) in
  do* gas.charge_gas (|
    evm,
    gas.GAS_CODE_HASH
  |) in
  let* account := state.get_account (|
    evm.["env"].["state"],
    address
  |) in
  (* TODO statement *)
  do* stack.push (|
    evm.["stack"],
    codehash
  |) in
  (* TODO statement *)


Definition self_balance : M unit :=
  (*
      Pushes the balance of the current address to the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  (* TODO statement *)
  do* gas.charge_gas (|
    evm,
    gas.GAS_FAST_STEP
  |) in
  let* balance := state.get_account (|
    evm.["env"].["state"],
    evm.["message"].["current_target"]
  |).["balance"] in
  do* stack.push (|
    evm.["stack"],
    balance
  |) in
  (* TODO statement *)

