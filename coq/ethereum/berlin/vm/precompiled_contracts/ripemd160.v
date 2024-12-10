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


Definition ripemd160 : M unit :=
  (*
      Writes the ripemd160 hash to output.

      Parameters
      ----------
      evm :
          The current EVM frame.
      *)
  let* data := evm.["message"].["data"] in
  let* word_count := (* TODO expression *) in
  do* charge_gas (|
    evm,
    (* TODO expression *)
  |) in
  let* hash_bytes := hashlib.["new"] (|
    (* TODO expression *),
    data
  |).["digest"] (|

  |) in
  let* padded_hash := left_pad_zero_bytes (|
    hash_bytes,
    (* TODO expression *)
  |) in
  (* TODO assignment *)

