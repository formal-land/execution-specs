(* Generated *)
(*
Ethereum Virtual Machine (EVM) SHA256 PRECOMPILED CONTRACT
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Implementation of the `SHA256` precompiled contract.
*)


Definition sha256 (evm : Evm) : M unit :=
  (*
      Writes the sha256 hash to output.

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
  (* TODO assignment *)
  M.pure tt.
