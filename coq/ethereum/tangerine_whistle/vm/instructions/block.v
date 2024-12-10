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
Require tangerine_whistle.vm.gas.
Require tangerine_whistle.vm.stack.

Definition block_hash : M unit :=
  (*
      Push the hash of one of the 256 most recent complete blocks onto the
      stack. The block number to hash is present at the top of the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

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


Definition difficulty : M unit :=
  (*
      Push the current block's difficulty onto the stack.

      Here the current block refers to the block in which the currently
      executing transaction/call resides.

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
      evm.["env"].["difficulty"]
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

