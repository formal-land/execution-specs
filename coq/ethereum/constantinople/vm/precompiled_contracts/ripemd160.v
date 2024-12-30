(* Generated *)
(*
Ethereum Virtual Machine (EVM) RIPEMD160 PRECOMPILED CONTRACT
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Implementation of the `RIPEMD160` precompiled contract.
*)


Definition ripemd160 (evm : Evm) : M unit :=
  (*
      Writes the ripemd160 hash to output.

      Parameters
      ----------
      evm :
          The current EVM frame.
      *)
  do* M.assign "data" [[
    M.get_field ~(| M.get_field ~(| evm, "message" |), "data" |) in
  ]] in
  do* M.assign "word_count" [[
    (* TODO expression *) in
  ]] in
  do* [[ M.get_local ~(| "charge_gas" |) ~(|
    evm,
    (* TODO expression *)
  |) ]] in
  do* M.assign "hash_bytes" [[
    M.get_field ~(| M.get_field ~(| M.get_local ~(| "hashlib" |), "new" |) ~(|
      (* TODO constant *),
      M.get_local ~(| "data" |)
    |), "digest" |) ~(|

    |) in
  ]] in
  do* M.assign "padded_hash" [[
    M.get_local ~(| "left_pad_zero_bytes" |) ~(|
      M.get_local ~(| "hash_bytes" |),
      32
    |) in
  ]] in
  (* TODO assignment *)
  M.pure tt.
