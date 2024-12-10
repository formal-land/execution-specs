(*
Ethereum Virtual Machine (EVM) IDENTITY PRECOMPILED CONTRACT
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Implementation of the `IDENTITY` precompiled contract.
*)

Require ethereum_types.numeric.
Require ethereum.utils.numeric.
Require frontier.vm.
Require frontier.vm.gas.

Definition identity : M unit :=
  (*
      Writes the message data to output.

      Parameters
      ----------
      evm :
          The current EVM frame.
      *)
  let* data := evm.["message"].["data"] in
  let* word_count := (* TODO expression *) in
  do* vm.gas.charge_gas (|
    evm,
    (* TODO expression *)
  |) in
  (* TODO assignment *)

