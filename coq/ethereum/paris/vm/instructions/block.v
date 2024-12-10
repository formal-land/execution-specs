(*
Ethereum Virtual Machine (EVM) Block Instructions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Implementations of the EVM block instructions.
*)

Require ethereum_types.numeric.
Require paris.vm.gas.
Require paris.vm.stack.

Definition block_hash : M unit :=
  (*
      Push the hash of one of the 256 most recent complete blocks onto the
      stack. The block number to hash is present at the top of the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      Raises
      ------
      :py:class:`~ethereum.paris.vm.exceptions.StackUnderflowError`
          If `len(stack)` is less than `1`.
      :py:class:`~ethereum.paris.vm.exceptions.OutOfGasError`
          If `evm.gas_left` is less than `20`.
      *)
  let* block_number := ethereum_types.numeric.Uint (|
    stack.pop (|
      evm.["stack"]
    |)
  |) in
  do* gas.charge_gas (|
    evm,
    gas.GAS_BLOCK_HASH
  |) in
  let* max_block_number := (* TODO expression *) in
  (* TODO statement *)
  do* stack.push (|
    evm.["stack"],
    ethereum_types.numeric.U256.["from_be_bytes"] (|
      hash
    |)
  |) in
  (* TODO statement *)


Definition coinbase : M unit :=
  (*
      Push the current block's beneficiary address (address of the block miner)
      onto the stack.

      Here the current block refers to the block in which the currently
      executing transaction/call resides.

      Parameters
      ----------
      evm :
          The current EVM frame.

      Raises
      ------
      :py:class:`~ethereum.paris.vm.exceptions.StackOverflowError`
          If `len(stack)` is equal to `1024`.
      :py:class:`~ethereum.paris.vm.exceptions.OutOfGasError`
          If `evm.gas_left` is less than `2`.
      *)
  (* TODO statement *)
  do* gas.charge_gas (|
    evm,
    gas.GAS_BASE
  |) in
  do* stack.push (|
    evm.["stack"],
    ethereum_types.numeric.U256.["from_be_bytes"] (|
      evm.["env"].["coinbase"]
    |)
  |) in
  (* TODO statement *)


Definition timestamp : M unit :=
  (*
      Push the current block's timestamp onto the stack. Here the timestamp
      being referred is actually the unix timestamp in seconds.

      Here the current block refers to the block in which the currently
      executing transaction/call resides.

      Parameters
      ----------
      evm :
          The current EVM frame.

      Raises
      ------
      :py:class:`~ethereum.paris.vm.exceptions.StackOverflowError`
          If `len(stack)` is equal to `1024`.
      :py:class:`~ethereum.paris.vm.exceptions.OutOfGasError`
          If `evm.gas_left` is less than `2`.
      *)
  (* TODO statement *)
  do* gas.charge_gas (|
    evm,
    gas.GAS_BASE
  |) in
  do* stack.push (|
    evm.["stack"],
    evm.["env"].["time"]
  |) in
  (* TODO statement *)


Definition number : M unit :=
  (*
      Push the current block's number onto the stack.

      Here the current block refers to the block in which the currently
      executing transaction/call resides.

      Parameters
      ----------
      evm :
          The current EVM frame.

      Raises
      ------
      :py:class:`~ethereum.paris.vm.exceptions.StackOverflowError`
          If `len(stack)` is equal to `1024`.
      :py:class:`~ethereum.paris.vm.exceptions.OutOfGasError`
          If `evm.gas_left` is less than `2`.
      *)
  (* TODO statement *)
  do* gas.charge_gas (|
    evm,
    gas.GAS_BASE
  |) in
  do* stack.push (|
    evm.["stack"],
    ethereum_types.numeric.U256 (|
      evm.["env"].["number"]
    |)
  |) in
  (* TODO statement *)


Definition prev_randao : M unit :=
  (*
      Push the `prev_randao` value onto the stack.

      The `prev_randao` value is the random output of the beacon chain's
      randomness oracle for the previous block.

      Parameters
      ----------
      evm :
          The current EVM frame.

      Raises
      ------
      :py:class:`~ethereum.paris.vm.exceptions.StackOverflowError`
          If `len(stack)` is equal to `1024`.
      :py:class:`~ethereum.paris.vm.exceptions.OutOfGasError`
          If `evm.gas_left` is less than `2`.
      *)
  (* TODO statement *)
  do* gas.charge_gas (|
    evm,
    gas.GAS_BASE
  |) in
  do* stack.push (|
    evm.["stack"],
    ethereum_types.numeric.U256.["from_be_bytes"] (|
      evm.["env"].["prev_randao"]
    |)
  |) in
  (* TODO statement *)


Definition gas_limit : M unit :=
  (*
      Push the current block's gas limit onto the stack.

      Here the current block refers to the block in which the currently
      executing transaction/call resides.

      Parameters
      ----------
      evm :
          The current EVM frame.

      Raises
      ------
      :py:class:`~ethereum.paris.vm.exceptions.StackOverflowError`
          If `len(stack)` is equal to `1024`.
      :py:class:`~ethereum.paris.vm.exceptions.OutOfGasError`
          If `evm.gas_left` is less than `2`.
      *)
  (* TODO statement *)
  do* gas.charge_gas (|
    evm,
    gas.GAS_BASE
  |) in
  do* stack.push (|
    evm.["stack"],
    ethereum_types.numeric.U256 (|
      evm.["env"].["gas_limit"]
    |)
  |) in
  (* TODO statement *)


Definition chain_id : M unit :=
  (*
      Push the chain id onto the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      Raises
      ------
      :py:class:`~ethereum.paris.vm.exceptions.StackOverflowError`
          If `len(stack)` is equal to `1024`.
      :py:class:`~ethereum.paris.vm.exceptions.OutOfGasError`
          If `evm.gas_left` is less than `2`.
      *)
  (* TODO statement *)
  do* gas.charge_gas (|
    evm,
    gas.GAS_BASE
  |) in
  do* stack.push (|
    evm.["stack"],
    ethereum_types.numeric.U256 (|
      evm.["env"].["chain_id"]
    |)
  |) in
  (* TODO statement *)

