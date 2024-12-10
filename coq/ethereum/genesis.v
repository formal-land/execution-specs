(*
Types and functions for beginning a new chain.

_Genesis_ is the term for the beginning of a new chain, and so a genesis block
is a block with no parent (its [`parent_hash`] is all zeros.)

The genesis configuration for a chain is specified with a
[`GenesisConfiguration`], and genesis blocks are created with
[`add_genesis_block`].

[`parent_hash`]: ref:ethereum.frontier.blocks.Header.parent_hash
[`GenesisConfiguration`]: ref:ethereum.genesis.GenesisConfiguration
[`add_genesis_block`]: ref:ethereum.genesis.add_genesis_block
*)


Definition get_genesis_configuration : M unit :=
  (*
      Read a genesis configuration from the given JSON file path.

      The genesis file should be present in the `assets` directory.
      *)
  let* genesis_path := (* TODO expression *) in
  let* genesis_bytes := pkgutil.["get_data"] (|
    (* TODO expression *),
    genesis_path
  |) in
  (* TODO statement *)
  let* genesis_data := json.["loads"] (|
    genesis_bytes.["decode"] (|

    |)
  |) in
  (* TODO statement *)


Definition hex_or_base_10_str_to_u256 : M unit :=
  (*
      Convert a string in either hexadecimal or base-10 to a `U256`.
      *)
  (* TODO statement *)


Definition add_genesis_block : M unit :=
  (*
      Adds the genesis block to an empty blockchain.

      The genesis block is an entirely sui generis block (unique) that is not
      governed by the general rules applying to all other Ethereum blocks.
      Instead, the only consensus requirement is that it must be identical to
      the block added by this function.

      The mainnet genesis configuration was originally created using the
      `mk_genesis_block.py` script. It is long since defunct, but is still
      available at <https://github.com/ethereum/genesis_block_generator>.

      The initial state is populated with balances based on the Ethereum presale
      that happened on the Bitcoin blockchain. Additional ether worth 1.98% of
      the presale was given to the foundation.

      The `state_root` is set to the root of the initial state. The `gas_limit`
      and `difficulty` are set to suitable starting values. In particular the
      low gas limit made sending transactions impossible in the early stages of
      Frontier.

      The `nonce` field is `0x42` referencing Douglas Adams' "HitchHiker's Guide
      to the Galaxy".

      The `extra_data` field contains the hash of block `1028201` on
      the pre-launch Olympus testnet. The creation of block `1028201` on Olympus
      marked the "starting gun" for Ethereum block creation. Including its hash
      in the genesis block ensured a fair launch of the Ethereum mining process.

      The remaining fields are set to appropriate default values.

      On testnets the genesis configuration usually allocates 1 wei to addresses
      `0x00` to `0xFF` to avoid edge cases around precompiles being created or
      cleared (by [EIP-161]).

      [EIP-161]: https://eips.ethereum.org/EIPS/eip-161
      *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  let* fields := (* TODO expression *) in
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  let* genesis_header := hardfork.["Header"] (|

  |) in
  let* block_fields := (* TODO expression *) in
  (* TODO statement *)
  let* genesis_block := hardfork.["Block"] (|

  |) in
  do* chain.["blocks"].["append"] (|
    genesis_block
  |) in
  (* TODO assignment *)

