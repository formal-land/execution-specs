(* Generated *)
(*
Hardfork Utility Functions For The Message Data-structure
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Message specific functions used in this arrow_glacier version of
specification.
*)

Require typing.
Require ethereum_types.bytes.
Require ethereum_types.numeric.
Require ethereum.arrow_glacier.fork_types.
Require ethereum.arrow_glacier.state.
Require ethereum.arrow_glacier.vm.
Require ethereum.arrow_glacier.vm.precompiled_contracts.mapping.
Require ethereum.arrow_glacier.utils.address.

Definition prepare_message (caller : Address) (target : (* TODO type *)) (value : U256) (data : Bytes) (gas : Uint) (env : Environment) (code_address : (* TODO type *)) (should_transfer_value : bool) (is_static : bool) (preaccessed_addresses : (* TODO type *)) (preaccessed_storage_keys : (* TODO type *)) : M Message :=
  (*
      Execute a transaction against the provided environment.

      Parameters
      ----------
      caller :
          Address which initiated the transaction
      target :
          Address whose code will be executed
      value :
          Value to be transferred.
      data :
          Array of bytes provided to the code in `target`.
      gas :
          Gas provided for the code in `target`.
      env :
          Environment for the Ethereum Virtual Machine.
      code_address :
          This is usually same as the `target` address except when an alternative
          accounts code needs to be executed.
          eg. `CALLCODE` calling a precompile.
      should_transfer_value :
          if True ETH should be transferred while executing a message call.
      is_static:
          if True then it prevents all state-changing operations from being
          executed.
      preaccessed_addresses:
          Addresses that should be marked as accessed prior to the message call
      preaccessed_storage_keys:
          Storage keys that should be marked as accessed prior to the message
          call

      Returns
      -------
      message: `ethereum.arrow_glacier.vm.Message`
          Items containing contract creation or message call specific data.
      *)
  (* TODO statement *)
  do* M.assign "accessed_addresses" [[
    M.get_local ~(| "set" |) ~(|

    |) in
  ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "accessed_addresses" |), "add" |) ~(|
    M.get_local ~(| "current_target" |)
  |) ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "accessed_addresses" |), "add" |) ~(|
    caller
  |) ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "accessed_addresses" |), "update" |) ~(|
    M.get_field ~(| vm.precompiled_contracts.mapping.PRE_COMPILED_CONTRACTS, "keys" |) ~(|

    |)
  |) ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "accessed_addresses" |), "update" |) ~(|
    preaccessed_addresses
  |) ]] in
  (* TODO statement *)
  M.pure tt.
