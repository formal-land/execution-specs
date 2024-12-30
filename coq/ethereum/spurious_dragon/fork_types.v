(* Generated *)
(*
Ethereum Types
^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Types re-used throughout the specification, which are specific to Ethereum.
*)

Require dataclasses.
Require ethereum_types.bytes.
Require ethereum_types.frozen.
Require ethereum_types.numeric.
Require ethereum.__init__.
Require ethereum.crypto.hash.

Definition encode_account (raw_account_data : Account) (storage_root : Bytes) : M Bytes :=
  (*
      Encode `Account` dataclass.

      Storage is not stored in the `Account` dataclass, so `Accounts` cannot be
      encoded without providing a storage root.
      *)
  (* TODO statement *)
  M.pure tt.
