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


Definition sha256 : M unit :=
  (*
      Writes the sha256 hash to output.

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
  (* TODO assignment *)

