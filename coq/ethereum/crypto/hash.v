(* Generated *)
(*
Cryptographic Hash Functions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Cryptographic hashing functions.
*)

Require Crypto.Hash.
Require ethereum_types.bytes.

Definition keccak256 (buffer : Bytes) : M Hash32 :=
  (*
      Computes the keccak256 hash of the input `buffer`.

      Parameters
      ----------
      buffer :
          Input for the hashing function.

      Returns
      -------
      hash : `ethereum.base_types.Hash32`
          Output of the hash function.
      *)
  do* M.assign "k" [[
    M.get_field ~(| Crypto.Hash.keccak, "new" |) ~(|

    |) in
  ]] in
  (* TODO statement *)
  M.pure tt.

Definition keccak512 (buffer : Bytes) : M Hash64 :=
  (*
      Computes the keccak512 hash of the input `buffer`.

      Parameters
      ----------
      buffer :
          Input for the hashing function.

      Returns
      -------
      hash : `ethereum.base_types.Hash32`
          Output of the hash function.
      *)
  do* M.assign "k" [[
    M.get_field ~(| Crypto.Hash.keccak, "new" |) ~(|

    |) in
  ]] in
  (* TODO statement *)
  M.pure tt.
