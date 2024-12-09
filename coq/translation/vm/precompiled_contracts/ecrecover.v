(*
Ethereum Virtual Machine (EVM) ECRECOVER PRECOMPILED CONTRACT
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Implementation of the ECRECOVER precompiled contract.
*)

Require ethereum_types.numeric.
Require ethereum.crypto.elliptic_curve.
Require ethereum.crypto.hash.
Require ethereum.utils.byte.
Require vm.
Require vm.gas.
Require vm.memory.
