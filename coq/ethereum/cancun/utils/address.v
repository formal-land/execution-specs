(* Generated *)
(*
Hardfork Utility Functions For Addresses
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Address specific functions used in this cancun version of
specification.
*)

Require typing.
Require ethereum_types.bytes.
Require ethereum_types.numeric.
Require ethereum.crypto.hash.
Require ethereum.utils.byte.
Require ethereum.__init__.
Require ethereum.cancun.fork_types.

Definition to_address (data : (* TODO type *)) : M Address :=
  (*
      Convert a Uint or U256 value to a valid address (20 bytes).

      Parameters
      ----------
      data :
          The string to be converted to bytes.

      Returns
      -------
      address : `Address`
          The obtained address.
      *)
  (* TODO statement *)
  M.pure tt.

Definition compute_contract_address (address : Address) (nonce : Uint) : M Address :=
  (*
      Computes address of the new account that needs to be created.

      Parameters
      ----------
      address :
          The address of the account that wants to create the new account.
      nonce :
          The transaction count of the account that wants to create the new
          account.

      Returns
      -------
      address: `Address`
          The computed address of the new account.
      *)
  do* M.assign "computed_address" [[
    ethereum.crypto.hash.keccak256 ~(|
      M.get_field ~(| __init__.rlp, "encode" |) ~(|
        (* TODO expression *)
      |)
    |) in
  ]] in
  do* M.assign "canonical_address" [[
    (* TODO expression *) in
  ]] in
  do* M.assign "padded_address" [[
    ethereum.utils.byte.left_pad_zero_bytes ~(|
      M.get_local ~(| "canonical_address" |),
      20
    |) in
  ]] in
  (* TODO statement *)
  M.pure tt.

Definition compute_create2_contract_address (address : Address) (salt : Bytes32) (call_data : bytearray) : M Address :=
  (*
      Computes address of the new account that needs to be created, which is
      based on the sender address, salt and the call data as well.

      Parameters
      ----------
      address :
          The address of the account that wants to create the new account.
      salt :
          Address generation salt.
      call_data :
          The code of the new account which is to be created.

      Returns
      -------
      address: `ethereum.cancun.fork_types.Address`
          The computed address of the new account.
      *)
  do* M.assign "preimage" [[
    (* TODO expression *) in
  ]] in
  do* M.assign "computed_address" [[
    ethereum.crypto.hash.keccak256 ~(|
      M.get_local ~(| "preimage" |)
    |) in
  ]] in
  do* M.assign "canonical_address" [[
    (* TODO expression *) in
  ]] in
  do* M.assign "padded_address" [[
    ethereum.utils.byte.left_pad_zero_bytes ~(|
      M.get_local ~(| "canonical_address" |),
      20
    |) in
  ]] in
  (* TODO statement *)
  M.pure tt.
