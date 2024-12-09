(*
Ethereum Virtual Machine (EVM) Interpreter
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

A straightforward interpreter that executes EVM code.
*)

Require dataclasses.
Require typing.
Require ethereum_types.bytes.
Require ethereum_types.numeric.
Require ethereum.trace.
Require blocks.
Require fork_types.
Require state.
Require vm.
Require vm.gas.
Require vm.precompiled_contracts.mapping.
Require exceptions.
Require instructions.
Require runtime.
