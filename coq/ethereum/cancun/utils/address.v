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
Require cancun.fork_types.

Definition to_address : M unit :=
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


Definition compute_contract_address : M unit :=
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
  let* computed_address := ethereum.crypto.hash.keccak256 (|
    rlp.["encode"] (|
      (* TODO expression *)
    |)
  |) in
  let* canonical_address := (* TODO expression *) in
  let* padded_address := ethereum.utils.byte.left_pad_zero_bytes (|
    canonical_address,
    (* TODO expression *)
  |) in
  (* TODO statement *)


Definition compute_create2_contract_address : M unit :=
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
  let* preimage := (* TODO expression *) in
  let* computed_address := ethereum.crypto.hash.keccak256 (|
    preimage
  |) in
  let* canonical_address := (* TODO expression *) in
  let* padded_address := ethereum.utils.byte.left_pad_zero_bytes (|
    canonical_address,
    (* TODO expression *)
  |) in
  (* TODO statement *)

