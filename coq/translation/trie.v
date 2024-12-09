(*
State Trie
^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

The state trie is the structure responsible for storing
`.fork_types.Account` objects.
*)

Require dataclasses.
Require typing.
Require ethereum_types.bytes.
Require ethereum_types.frozen.
Require ethereum_types.numeric.
Require ethereum.crypto.hash.
Require ethereum.shanghai.
Require ethereum.utils.hexadecimal.
Require blocks.
Require fork_types.
Require transactions.
