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

Definition keccak256 : M unit :=
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
  let* k := Crypto.Hash.keccak.["new"] (|

  |) in
  (* TODO statement *)


Definition keccak512 : M unit :=
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
  let* k := Crypto.Hash.keccak.["new"] (|

  |) in
  (* TODO statement *)

