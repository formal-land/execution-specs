(*
Ethereum Virtual Machine (EVM) POINT EVALUATION PRECOMPILED CONTRACT
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Implementation of the POINT EVALUATION precompiled contract.
*)

Require ethereum_types.bytes.
Require ethereum_types.numeric.
Require ethereum.crypto.kzg.
Require vm.
Require vm.exceptions.
Require vm.gas.
