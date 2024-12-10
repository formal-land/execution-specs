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
Require ..crypto.hash.

Definition encode_account : M unit :=
  (*
      Encode `Account` dataclass.

      Storage is not stored in the `Account` dataclass, so `Accounts` cannot be
      encoded without providing a storage root.
      *)
  (* TODO statement *)

