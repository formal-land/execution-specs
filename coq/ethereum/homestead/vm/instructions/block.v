(* Generated *)
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
Require ethereum.homestead.vm.__init__.
Require ethereum.homestead.vm.gas.
Require ethereum.homestead.vm.stack.

Definition block_hash (evm : Evm) : M unit :=
  (*
      Push the hash of one of the 256 most recent complete blocks onto the
      stack. The block number to hash is present at the top of the stack.

      Parameters
      ----------
      evm :
          The current EVM frame.

      *)
  do* M.assign "block_number" [[
    ethereum_types.numeric.Uint ~(|
      stack.pop ~(|
        M.get_field ~(| evm, "stack" |)
      |)
    |) in
  ]] in
  do* [[ gas.charge_gas ~(|
    evm,
    gas.GAS_BLOCK_HASH
  |) ]] in
  do* M.assign "max_block_number" [[
    (* TODO expression *) in
  ]] in
  (* TODO statement *)
  do* [[ stack.push ~(|
    M.get_field ~(| evm, "stack" |),
    M.get_field ~(| ethereum_types.numeric.U256, "from_be_bytes" |) ~(|
      M.get_local ~(| "hash" |)
    |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition coinbase (evm : Evm) : M unit :=
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
  do* [[ gas.charge_gas ~(|
    evm,
    gas.GAS_BASE
  |) ]] in
  do* [[ stack.push ~(|
    M.get_field ~(| evm, "stack" |),
    M.get_field ~(| ethereum_types.numeric.U256, "from_be_bytes" |) ~(|
      M.get_field ~(| M.get_field ~(| evm, "env" |), "coinbase" |)
    |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition timestamp (evm : Evm) : M unit :=
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
  do* [[ gas.charge_gas ~(|
    evm,
    gas.GAS_BASE
  |) ]] in
  do* [[ stack.push ~(|
    M.get_field ~(| evm, "stack" |),
    M.get_field ~(| M.get_field ~(| evm, "env" |), "time" |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition number (evm : Evm) : M unit :=
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
  do* [[ gas.charge_gas ~(|
    evm,
    gas.GAS_BASE
  |) ]] in
  do* [[ stack.push ~(|
    M.get_field ~(| evm, "stack" |),
    ethereum_types.numeric.U256 ~(|
      M.get_field ~(| M.get_field ~(| evm, "env" |), "number" |)
    |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition difficulty (evm : Evm) : M unit :=
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
  do* [[ gas.charge_gas ~(|
    evm,
    gas.GAS_BASE
  |) ]] in
  do* [[ stack.push ~(|
    M.get_field ~(| evm, "stack" |),
    ethereum_types.numeric.U256 ~(|
      M.get_field ~(| M.get_field ~(| evm, "env" |), "difficulty" |)
    |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.

Definition gas_limit (evm : Evm) : M unit :=
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
  do* [[ gas.charge_gas ~(|
    evm,
    gas.GAS_BASE
  |) ]] in
  do* [[ stack.push ~(|
    M.get_field ~(| evm, "stack" |),
    ethereum_types.numeric.U256 ~(|
      M.get_field ~(| M.get_field ~(| evm, "env" |), "gas_limit" |)
    |)
  |) ]] in
  do* M.aug_assign [[ M.get_field ~(| evm, "pc" |) ]] [[
    ethereum_types.numeric.Uint ~(|
      1
    |)
  ]] in
  M.pure tt.
