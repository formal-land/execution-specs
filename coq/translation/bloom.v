(*
Ethereum Logs Bloom
^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

This modules defines functions for calculating bloom filters of logs. For the
general theory of bloom filters see e.g. `Wikipedia
<https://en.wikipedia.org/wiki/Bloom_filter>`_. Bloom filters are used to allow
for efficient searching of logs by address and/or topic, by rapidly
eliminating blocks and receipts from their search.
*)

Require typing.
Require ethereum_types.numeric.
Require ethereum.crypto.hash.
Require blocks.
Require fork_types.
