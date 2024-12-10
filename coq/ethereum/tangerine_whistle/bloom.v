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
Require tangerine_whistle.blocks.
Require tangerine_whistle.fork_types.

Definition add_to_bloom : M unit :=
  (*
      Add a bloom entry to the bloom filter (`bloom`).

      The number of hash functions used is 3. They are calculated by taking the
      least significant 11 bits from the first 3 16-bit words of the
      `keccak_256()` hash of `bloom_entry`.

      Parameters
      ----------
      bloom :
          The bloom filter.
      bloom_entry :
          An entry which is to be added to bloom filter.
      *)
  let* hash := ethereum.crypto.hash.keccak256 (|
    bloom_entry
  |) in
  (* TODO statement *)


Definition logs_bloom : M unit :=
  (*
      Obtain the logs bloom from a list of log entries.

      The address and each topic of a log are added to the bloom filter.

      Parameters
      ----------
      logs :
          List of logs for which the logs bloom is to be obtained.

      Returns
      -------
      logs_bloom : `Bloom`
          The logs bloom obtained which is 256 bytes with some bits set as per
          the caller address and the log topics.
      *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)

