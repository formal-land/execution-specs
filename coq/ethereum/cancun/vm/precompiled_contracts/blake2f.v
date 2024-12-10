(*
Ethereum Virtual Machine (EVM) Blake2 PRECOMPILED CONTRACT
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Implementation of the `Blake2` precompiled contract.
*)

Require ethereum.crypto.blake2.
Require cancun.vm.
Require cancun.vm.gas.
Require cancun.vm.exceptions.

Definition blake2f : M unit :=
  (*
      Writes the Blake2 hash to output.

      Parameters
      ----------
      evm :
          The current EVM frame.
      *)
  let* data := evm.["message"].["data"] in
  (* TODO statement *)
  let* blake2b := ethereum.crypto.blake2.Blake2b (|

  |) in
  (* TODO assignment *)
  do* vm.gas.charge_gas (|
    evm,
    (* TODO expression *)
  |) in
  (* TODO statement *)
  (* TODO assignment *)

