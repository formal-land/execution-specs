(*
State
^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

The state contains all information that is preserved between transactions.

It consists of a main account trie and storage tries for each contract.

There is a distinction between an account that does not exist and
`EMPTY_ACCOUNT`.
*)

Require dataclasses.
Require typing.
Require ethereum_types.bytes.
Require ethereum_types.frozen.
Require ethereum_types.numeric.
Require blocks.
Require fork_types.
Require trie.
