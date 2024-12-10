(*
Ethash is a proof-of-work algorithm designed to be [ASIC] resistant through
[memory hardness][mem-hard].

To achieve memory hardness, computing Ethash requires access to subsets of a
large structure. The particular subsets chosen are based on the nonce and block
header, while the set itself is changed every [`epoch`].

At a high level, the Ethash algorithm is as follows:

1. Create a **seed** value, generated with [`generate_seed`] and based on the
   preceding block numbers.
1. From the seed, compute a pseudorandom **cache** with [`generate_cache`].
1. From the cache, generate a **dataset** with [`generate_dataset`]. The
   dataset grows over time based on [`DATASET_EPOCH_GROWTH_SIZE`].
1. Miners hash slices of the dataset together, which is where the memory
   hardness is introduced. Verification of the proof-of-work only requires the
   cache to be able to recompute a much smaller subset of the full dataset.

[`DATASET_EPOCH_GROWTH_SIZE`]: ref:ethereum.ethash.DATASET_EPOCH_GROWTH_SIZE
[`generate_dataset`]: ref:ethereum.ethash.generate_dataset
[`generate_cache`]: ref:ethereum.ethash.generate_cache
[`generate_seed`]: ref:ethereum.ethash.generate_seed
[`epoch`]: ref:ethereum.ethash.epoch
[ASIC]: https://en.wikipedia.org/wiki/Application-specific_integrated_circuit
[mem-hard]: https://en.wikipedia.org/wiki/Memory-hard_function
*)

Require typing.
Require ethereum_types.bytes.
Require ethereum_types.numeric.
Require ethereum.crypto.hash.
Require ethereum.utils.numeric.

Definition epoch : M unit :=
  (*
      Obtain the epoch number to which the block identified by `block_number`
      belongs. The first epoch is numbered zero.

      An Ethash epoch is a fixed number of blocks ([`EPOCH_SIZE`]) long, during
      which the dataset remains constant. At the end of each epoch, the dataset
      is generated anew. See [`generate_dataset`].

      [`EPOCH_SIZE`]: ref:ethereum.ethash.EPOCH_SIZE
      [`generate_dataset`]: ref:ethereum.ethash.generate_dataset
      *)
  (* TODO statement *)


Definition cache_size : M unit :=
  (*
      Obtain the cache size (in bytes) of the epoch to which `block_number`
      belongs.

      See [`INITIAL_CACHE_SIZE`] and [`CACHE_EPOCH_GROWTH_SIZE`] for the initial
      size and linear growth rate, respectively. The cache is generated in
      [`generate_cache`].

      The actual cache size is smaller than simply multiplying
      `CACHE_EPOCH_GROWTH_SIZE` by the epoch number to minimize the risk of
      unintended cyclic behavior. It is defined as the highest prime number below
      what linear growth would calculate.

      [`INITIAL_CACHE_SIZE`]: ref:ethereum.ethash.INITIAL_CACHE_SIZE
      [`CACHE_EPOCH_GROWTH_SIZE`]: ref:ethereum.ethash.CACHE_EPOCH_GROWTH_SIZE
      [`generate_cache`]: ref:ethereum.ethash.generate_cache
      *)
  let* size := (* TODO expression *) in
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)


Definition dataset_size : M unit :=
  (*
      Obtain the dataset size (in bytes) of the epoch to which `block_number`
      belongs.

      See [`INITIAL_DATASET_SIZE`] and [`DATASET_EPOCH_GROWTH_SIZE`][ds] for the
      initial size and linear growth rate, respectively. The complete dataset is
      generated in [`generate_dataset`], while the slices used in verification
      are generated in [`generate_dataset_item`].

      The actual dataset size is smaller than simply multiplying
      `DATASET_EPOCH_GROWTH_SIZE` by the epoch number to minimize the risk of
      unintended cyclic behavior. It is defined as the highest prime number below
      what linear growth would calculate.

      [`INITIAL_DATASET_SIZE`]: ref:ethereum.ethash.INITIAL_DATASET_SIZE
      [ds]: ref:ethereum.ethash.DATASET_EPOCH_GROWTH_SIZE
      [`generate_dataset`]: ref:ethereum.ethash.generate_dataset
      [`generate_dataset_item`]: ref:ethereum.ethash.generate_dataset_item
      *)
  let* size := (* TODO expression *) in
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)


Definition generate_seed : M unit :=
  (*
      Obtain the cache generation seed for the block identified by
      `block_number`. See [`generate_cache`].

      [`generate_cache`]: ref:ethereum.ethash.generate_cache
      *)
  let* epoch_number := epoch (|
    block_number
  |) in
  let* seed := (* TODO expression *) in
  (* TODO statement *)
  (* TODO statement *)


Definition generate_cache : M unit :=
  (*
      Generate the cache for the block identified by `block_number`. See
      [`generate_dataset`] for how the cache is used.

      The cache is generated in two steps: filling the array with a chain of
      [`keccak512`] hashes, then running two rounds of Sergio Demian Lerner's
      [RandMemoHash] on those bytes.

      [`keccak512`]: ref:ethereum.crypto.hash.keccak512
      [`generate_dataset`]: ref:ethereum.ethash.generate_dataset
      [RandMemoHash]: http://www.hashcash.org/papers/memohash.pdf
      *)
  let* seed := generate_seed (|
    block_number
  |) in
  let* cache_size_bytes := cache_size (|
    block_number
  |) in
  let* cache_size_words := (* TODO expression *) in
  let* cache := (* TODO expression *) in
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)


Definition fnv : M unit :=
  (*
      A non-associative substitute for XOR, inspired by the [FNV] hash by Fowler,
      Noll, and Vo. See [`fnv_hash`], [`generate_dataset_item`], and
      [`hashimoto`].

      Note that here we multiply the prime with the full 32-bit input, in
      contrast with the [FNV-1] spec which multiplies the prime with one byte
      (octet) in turn.

      [`hashimoto`]: ref:ethereum.ethash.hashimoto
      [`generate_dataset_item`]: ref:ethereum.ethash.generate_dataset_item
      [`fnv_hash`]: ref:ethereum.ethash.fnv_hash
      [FNV]: https://w.wiki/XKZ
      [FNV-1]: http://www.isthe.com/chongo/tech/comp/fnv/#FNV-1
      *)
  let* result := (* TODO expression *) in
  (* TODO statement *)


Definition fnv_hash : M unit :=
  (*
      Combines `data` into `mix_integers` using [`fnv`]. See [`hashimoto`] and
      [`generate_dataset_item`].

      [`hashimoto`]: ref:ethereum.ethash.hashimoto
      [`generate_dataset_item`]: ref:ethereum.ethash.generate_dataset_item
      [`fnv`]: ref:ethereum.ethash.fnv
      *)
  (* TODO statement *)


Definition generate_dataset_item : M unit :=
  (*
      Generate a particular dataset item 0-indexed by `index` by hashing
      pseudorandomly-selected entries from `cache` together. See [`fnv`] and
      [`fnv_hash`] for the digest function, [`generate_cache`] for generating
      `cache`, and [`generate_dataset`] for the full dataset generation
      algorithm.

      [`fnv`]: ref:ethereum.ethash.fnv
      [`fnv_hash`]: ref:ethereum.ethash.fnv_hash
      [`generate_dataset`]: ref:ethereum.ethash.generate_dataset
      [`generate_cache`]: ref:ethereum.ethash.generate_cache
      *)
  let* mix := ethereum.crypto.hash.keccak512 (|
    (* TODO expression *).["to_le_bytes64"] (|

    |)
  |) in
  let* mix_integers := ethereum.utils.numeric.le_bytes_to_uint32_sequence (|
    mix
  |) in
  (* TODO statement *)
  let* mix := ethereum.crypto.hash.Hash64 (|
    ethereum.utils.numeric.le_uint32_sequence_to_bytes (|
      mix_integers
    |)
  |) in
  (* TODO statement *)


Definition generate_dataset : M unit :=
  (*
      Generate the full dataset for the block identified by `block_number`.

      This function is present only for demonstration purposes. It is not used
      while validating blocks.
      *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)


Definition hashimoto : M unit :=
  (*
      Obtain the mix digest and the final value for a header, by aggregating
      data from the full dataset.

      #### Parameters

      - `header_hash` is a valid [RLP hash] of a block header.
      - `nonce` is the propagated nonce for the given block.
      - `dataset_size` is the size of the dataset. See [`dataset_size`].
      - `fetch_dataset_item` is a function that retrieves a specific dataset item
        based on its index.

      #### Returns

      - The mix digest generated from the header hash and propagated nonce.
      - The final result obtained which will be checked for leading zeros (in
        byte representation) in correspondence with the block difficulty.

      [RLP hash]: ref:ethereum.rlp.rlp_hash
      [`dataset_size`]: ref:ethereum.ethash.dataset_size
      *)
  let* nonce_le := bytes (|
    reversed (|
      nonce
    |)
  |) in
  let* seed_hash := ethereum.crypto.hash.keccak512 (|
    (* TODO expression *)
  |) in
  let* seed_head := ethereum_types.numeric.U32.["from_le_bytes"] (|
    (* TODO expression *)
  |) in
  let* rows := (* TODO expression *) in
  let* mix := (* TODO expression *) in
  (* TODO statement *)
  let* compressed_mix := (* TODO expression *) in
  (* TODO statement *)
  let* mix_digest := ethereum.utils.numeric.le_uint32_sequence_to_bytes (|
    compressed_mix
  |) in
  let* result := ethereum.crypto.hash.keccak256 (|
    (* TODO expression *)
  |) in
  (* TODO statement *)


Definition hashimoto_light : M unit :=
  (*
      Run the [`hashimoto`] algorithm by generating dataset item using the cache
      instead of loading the full dataset into main memory.

      #### Parameters

      - `header_hash` is a valid [RLP hash] of a block header.
      - `nonce` is the propagated nonce for the given block.
      - `cache` is the cache generated by [`generate_cache`].
      - `dataset_size` is the size of the dataset. See [`dataset_size`].

      #### Returns

      - The mix digest generated from the header hash and propagated nonce.
      - The final result obtained which will be checked for leading zeros (in
        byte representation) in correspondence with the block difficulty.

      [RLP hash]: ref:ethereum.rlp.rlp_hash
      [`dataset_size`]: ref:ethereum.ethash.dataset_size
      [`generate_cache`]: ref:ethereum.ethash.generate_cache
      [`hashimoto`]: ref:ethereum.ethash.hashimoto
      *)
  (* TODO statement *)
  (* TODO statement *)

