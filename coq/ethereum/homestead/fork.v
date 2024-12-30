(* Generated *)
(*
Ethereum Specification
^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Entry point for the Ethereum specification.
*)

Require dataclasses.
Require typing.
Require ethereum_types.bytes.
Require ethereum_types.numeric.
Require ethereum.crypto.elliptic_curve.
Require ethereum.crypto.hash.
Require ethereum.ethash.
Require ethereum.exceptions.
Require ethereum.__init__.
Require ethereum.homestead.__init__.
Require ethereum.homestead.blocks.
Require ethereum.homestead.bloom.
Require ethereum.homestead.fork_types.
Require ethereum.homestead.state.
Require ethereum.homestead.transactions.
Require ethereum.homestead.trie.
Require ethereum.homestead.utils.message.
Require ethereum.homestead.vm.interpreter.

Definition apply_fork (old : BlockChain) : M BlockChain :=
  (*
      Transforms the state from the previous hard fork (`old`) into the block
      chain object for this hard fork and returns it.

      When forks need to implement an irregular state transition, this function
      is used to handle the irregularity. See the :ref:`DAO Fork <dao-fork>` for
      an example.

      Parameters
      ----------
      old :
          Previous block chain object.

      Returns
      -------
      new : `BlockChain`
          Upgraded block chain object for this hard fork.
      *)
  (* TODO statement *)
  M.pure tt.

Definition get_last_256_block_hashes (chain : BlockChain) : M (* TODO type *) :=
  (*
      Obtain the list of hashes of the previous 256 blocks in order of
      increasing block number.

      This function will return less hashes for the first 256 blocks.

      The ``BLOCKHASH`` opcode needs to access the latest hashes on the chain,
      therefore this function retrieves them.

      Parameters
      ----------
      chain :
          History and current state.

      Returns
      -------
      recent_block_hashes : `List[Hash32]`
          Hashes of the recent 256 blocks in order of increasing block number.
      *)
  do* M.assign "recent_blocks" [[
    (* TODO expression *) in
  ]] in
  (* TODO statement *)
  do* M.assign "recent_block_hashes" [[
    (* TODO expression *) in
  ]] in
  (* TODO statement *)
  do* M.assign "most_recent_block_hash" [[
    ethereum.crypto.hash.keccak256 ~(|
      M.get_field ~(| __init__.rlp, "encode" |) ~(|
        M.get_field ~(| (* TODO expression *), "header" |)
      |)
    |) in
  ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "recent_block_hashes" |), "append" |) ~(|
    M.get_local ~(| "most_recent_block_hash" |)
  |) ]] in
  (* TODO statement *)
  M.pure tt.

Definition state_transition (chain : BlockChain) (block : Block) : M unit :=
  (*
      Attempts to apply a block to an existing block chain.

      All parts of the block's contents need to be verified before being added
      to the chain. Blocks are verified by ensuring that the contents of the
      block make logical sense with the contents of the parent block. The
      information in the block's header must also match the corresponding
      information in the block.

      To implement Ethereum, in theory clients are only required to store the
      most recent 255 blocks of the chain since as far as execution is
      concerned, only those blocks are accessed. Practically, however, clients
      should store more blocks to handle reorgs.

      Parameters
      ----------
      chain :
          History and current state.
      block :
          Block to apply to `chain`.
      *)
  do* M.assign "parent_header" [[
    M.get_field ~(| (* TODO expression *), "header" |) in
  ]] in
  do* [[ M.get_local ~(| "validate_header" |) ~(|
    M.get_field ~(| block, "header" |),
    M.get_local ~(| "parent_header" |)
  |) ]] in
  do* [[ M.get_local ~(| "validate_ommers" |) ~(|
    M.get_field ~(| block, "ommers" |),
    M.get_field ~(| block, "header" |),
    chain
  |) ]] in
  do* M.assign "apply_body_output" [[
    M.get_local ~(| "apply_body" |) ~(|
      M.get_field ~(| chain, "state" |),
      M.get_local ~(| "get_last_256_block_hashes" |) ~(|
        chain
      |),
      M.get_field ~(| M.get_field ~(| block, "header" |), "coinbase" |),
      M.get_field ~(| M.get_field ~(| block, "header" |), "number" |),
      M.get_field ~(| M.get_field ~(| block, "header" |), "gas_limit" |),
      M.get_field ~(| M.get_field ~(| block, "header" |), "timestamp" |),
      M.get_field ~(| M.get_field ~(| block, "header" |), "difficulty" |),
      M.get_field ~(| block, "transactions" |),
      M.get_field ~(| block, "ommers" |)
    |) in
  ]] in
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  do* [[ M.get_field ~(| M.get_field ~(| chain, "blocks" |), "append" |) ~(|
    block
  |) ]] in
  (* TODO statement *)
  M.pure tt.

Definition validate_header (header : Header) (parent_header : Header) : M unit :=
  (*
      Verifies a block header.

      In order to consider a block's header valid, the logic for the
      quantities in the header should match the logic for the block itself.
      For example the header timestamp should be greater than the block's parent
      timestamp because the block was created *after* the parent block.
      Additionally, the block's number should be directly following the parent
      block's number since it is the next block in the sequence.

      Parameters
      ----------
      header :
          Header to check for correctness.
      parent_header :
          Parent Header of the header to check for correctness
      *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  do* M.assign "block_difficulty" [[
    M.get_local ~(| "calculate_block_difficulty" |) ~(|
      M.get_field ~(| header, "number" |),
      M.get_field ~(| header, "timestamp" |),
      M.get_field ~(| parent_header, "timestamp" |),
      M.get_field ~(| parent_header, "difficulty" |)
    |) in
  ]] in
  (* TODO statement *)
  do* M.assign "block_parent_hash" [[
    ethereum.crypto.hash.keccak256 ~(|
      M.get_field ~(| __init__.rlp, "encode" |) ~(|
        parent_header
      |)
    |) in
  ]] in
  (* TODO statement *)
  do* [[ M.get_local ~(| "validate_proof_of_work" |) ~(|
    header
  |) ]] in
  M.pure tt.

Definition generate_header_hash_for_pow (header : Header) : M Hash32 :=
  (*
      Generate rlp hash of the header which is to be used for Proof-of-Work
      verification.

      In other words, the PoW artefacts `mix_digest` and `nonce` are ignored
      while calculating this hash.

      A particular PoW is valid for a single hash, that hash is computed by
      this function. The `nonce` and `mix_digest` are omitted from this hash
      because they are being changed by miners in their search for a sufficient
      proof-of-work.

      Parameters
      ----------
      header :
          The header object for which the hash is to be generated.

      Returns
      -------
      hash : `Hash32`
          The PoW valid rlp hash of the passed in header.
      *)
  do* M.assign "header_data_without_pow_artefacts" [[
    (* TODO expression *) in
  ]] in
  (* TODO statement *)
  M.pure tt.

Definition validate_proof_of_work (header : Header) : M unit :=
  (*
      Validates the Proof of Work constraints.

      In order to verify that a miner's proof-of-work is valid for a block, a
      ``mix-digest`` and ``result`` are calculated using the ``hashimoto_light``
      hash function. The mix digest is a hash of the header and the nonce that
      is passed through and it confirms whether or not proof-of-work was done
      on the correct block. The result is the actual hash value of the block.

      Parameters
      ----------
      header :
          Header of interest.
      *)
  do* M.assign "header_hash" [[
    M.get_local ~(| "generate_header_hash_for_pow" |) ~(|
      header
    |) in
  ]] in
  do* M.assign "cache" [[
    ethereum.ethash.generate_cache ~(|
      M.get_field ~(| header, "number" |)
    |) in
  ]] in
  (* TODO assignment *)
  (* TODO statement *)
  do* M.assign "limit" [[
    (* TODO expression *) in
  ]] in
  (* TODO statement *)
  M.pure tt.

Definition check_transaction (tx : Transaction) (gas_available : Uint) : M Address :=
  (*
      Check if the transaction is includable in the block.

      Parameters
      ----------
      tx :
          The transaction.
      gas_available :
          The gas remaining in the block.

      Returns
      -------
      sender_address :
          The sender of the transaction.

      Raises
      ------
      InvalidBlock :
          If the transaction is not includable.
      *)
  (* TODO statement *)
  do* M.assign "sender_address" [[
    M.get_local ~(| "recover_sender" |) ~(|
      tx
    |) in
  ]] in
  (* TODO statement *)
  M.pure tt.

Definition make_receipt (tx : Transaction) (post_state : Bytes32) (cumulative_gas_used : Uint) (logs : (* TODO type *)) : M Receipt :=
  (*
      Make the receipt for a transaction that was executed.

      Parameters
      ----------
      tx :
          The executed transaction.
      post_state :
          The state root immediately after this transaction.
      cumulative_gas_used :
          The total gas used so far in the block after the transaction was
          executed.
      logs :
          The logs produced by the transaction.

      Returns
      -------
      receipt :
          The receipt for the transaction.
      *)
  do* M.assign "receipt" [[
    blocks.Receipt ~(|

    |) in
  ]] in
  (* TODO statement *)
  M.pure tt.

Definition apply_body (state : State) (block_hashes : (* TODO type *)) (coinbase : Address) (block_number : Uint) (block_gas_limit : Uint) (block_time : U256) (block_difficulty : Uint) (transactions : (* TODO type *)) (ommers : (* TODO type *)) : M ApplyBodyOutput :=
  (*
      Executes a block.

      Many of the contents of a block are stored in data structures called
      tries. There is a transactions trie which is similar to a ledger of the
      transactions stored in the current block. There is also a receipts trie
      which stores the results of executing a transaction, like the post state
      and gas used. This function creates and executes the block that is to be
      added to the chain.

      Parameters
      ----------
      state :
          Current account state.
      block_hashes :
          List of hashes of the previous 256 blocks in the order of
          increasing block number.
      coinbase :
          Address of account which receives block reward and transaction fees.
      block_number :
          Position of the block within the chain.
      block_gas_limit :
          Initial amount of gas available for execution in this block.
      block_time :
          Time the block was produced, measured in seconds since the epoch.
      block_difficulty :
          Difficulty of the block.
      transactions :
          Transactions included in the block.
      ommers :
          Headers of ancestor blocks which are not direct parents (formerly
          uncles.)

      Returns
      -------
      apply_body_output : `ApplyBodyOutput`
          Output of applying the block body to the state.
      *)
  do* M.assign "gas_available" [[
    block_gas_limit in
  ]] in
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  do* [[ M.get_local ~(| "pay_rewards" |) ~(|
    state,
    block_number,
    coinbase,
    ommers
  |) ]] in
  do* M.assign "block_gas_used" [[
    (* TODO expression *) in
  ]] in
  do* M.assign "block_logs_bloom" [[
    bloom.logs_bloom ~(|
      M.get_local ~(| "block_logs" |)
    |) in
  ]] in
  (* TODO statement *)
  M.pure tt.

Definition validate_ommers (ommers : (* TODO type *)) (block_header : Header) (chain : BlockChain) : M unit :=
  (*
      Validates the ommers mentioned in the block.

      An ommer block is a block that wasn't canonically added to the
      blockchain because it wasn't validated as fast as the canonical block
      but was mined at the same time.

      To be considered valid, the ommers must adhere to the rules defined in
      the Ethereum protocol. The maximum amount of ommers is 2 per block and
      there cannot be duplicate ommers in a block. Many of the other ommer
      constraints are listed in the in-line comments of this function.

      Parameters
      ----------
      ommers :
          List of ommers mentioned in the current block.
      block_header:
          The header of current block.
      chain :
          History and current state.
      *)
  do* M.assign "block_hash" [[
    M.get_field ~(| __init__.rlp, "rlp_hash" |) ~(|
      block_header
    |) in
  ]] in
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  do* M.assign "ommers_hashes" [[
    (* TODO expression *) in
  ]] in
  (* TODO statement *)
  do* M.assign "recent_canonical_blocks" [[
    (* TODO expression *) in
  ]] in
  do* M.assign "recent_canonical_block_hashes" [[
    (* TODO expression *) in
  ]] in
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.

Definition pay_rewards (state : State) (block_number : Uint) (coinbase : Address) (ommers : (* TODO type *)) : M unit :=
  (*
      Pay rewards to the block miner as well as the ommers miners.

      The miner of the canonical block is rewarded with the predetermined
      block reward, ``BLOCK_REWARD``, plus a variable award based off of the
      number of ommer blocks that were mined around the same time, and included
      in the canonical block's header. An ommer block is a block that wasn't
      added to the canonical blockchain because it wasn't validated as fast as
      the accepted block but was mined at the same time. Although not all blocks
      that are mined are added to the canonical chain, miners are still paid a
      reward for their efforts. This reward is called an ommer reward and is
      calculated based on the number associated with the ommer block that they
      mined.

      Parameters
      ----------
      state :
          Current account state.
      block_number :
          Position of the block within the chain.
      coinbase :
          Address of account which receives block reward and transaction fees.
      ommers :
          List of ommers mentioned in the current block.
      *)
  do* M.assign "ommer_count" [[
    ethereum_types.numeric.U256 ~(|
      M.get_local ~(| "len" |) ~(|
        ommers
      |)
    |) in
  ]] in
  do* M.assign "miner_reward" [[
    (* TODO expression *) in
  ]] in
  do* [[ state.create_ether ~(|
    state,
    coinbase,
    M.get_local ~(| "miner_reward" |)
  |) ]] in
  (* TODO statement *)
  M.pure tt.

Definition process_transaction (env : (* TODO type *)) (tx : Transaction) : M (* TODO type *) :=
  (*
      Execute a transaction against the provided environment.

      This function processes the actions needed to execute a transaction.
      It decrements the sender's account after calculating the gas fee and
      refunds them the proper amount after execution. Calling contracts,
      deploying code, and incrementing nonces are all examples of actions that
      happen within this function or from a call made within this function.

      Accounts that are marked for deletion are processed and destroyed after
      execution.

      Parameters
      ----------
      env :
          Environment for the Ethereum Virtual Machine.
      tx :
          Transaction to execute.

      Returns
      -------
      gas_left : `ethereum.base_types.U256`
          Remaining gas after execution.
      logs : `Tuple[ethereum.blocks.Log, ...]`
          Logs generated during execution.
      *)
  (* TODO statement *)
  do* M.assign "sender" [[
    M.get_field ~(| env, "origin" |) in
  ]] in
  do* M.assign "sender_account" [[
    state.get_account ~(|
      M.get_field ~(| env, "state" |),
      M.get_local ~(| "sender" |)
    |) in
  ]] in
  do* M.assign "gas_fee" [[
    (* TODO expression *) in
  ]] in
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  do* M.assign "gas" [[
    (* TODO expression *) in
  ]] in
  do* [[ state.increment_nonce ~(|
    M.get_field ~(| env, "state" |),
    M.get_local ~(| "sender" |)
  |) ]] in
  do* M.assign "sender_balance_after_gas_fee" [[
    (* TODO expression *) in
  ]] in
  do* [[ state.set_account_balance ~(|
    M.get_field ~(| env, "state" |),
    M.get_local ~(| "sender" |),
    ethereum_types.numeric.U256 ~(|
      M.get_local ~(| "sender_balance_after_gas_fee" |)
    |)
  |) ]] in
  do* M.assign "message" [[
    utils.message.prepare_message ~(|
      M.get_local ~(| "sender" |),
      M.get_field ~(| tx, "to" |),
      M.get_field ~(| tx, "value" |),
      M.get_field ~(| tx, "data" |),
      M.get_local ~(| "gas" |),
      env
    |) in
  ]] in
  do* M.assign "output" [[
    vm.interpreter.process_message_call ~(|
      M.get_local ~(| "message" |),
      env
    |) in
  ]] in
  do* M.assign "gas_used" [[
    (* TODO expression *) in
  ]] in
  do* M.assign "gas_refund" [[
    M.get_local ~(| "min" |) ~(|
      (* TODO expression *),
      ethereum_types.numeric.Uint ~(|
        M.get_field ~(| M.get_local ~(| "output" |), "refund_counter" |)
      |)
    |) in
  ]] in
  do* M.assign "gas_refund_amount" [[
    (* TODO expression *) in
  ]] in
  do* M.assign "transaction_fee" [[
    (* TODO expression *) in
  ]] in
  do* M.assign "total_gas_used" [[
    (* TODO expression *) in
  ]] in
  do* M.assign "sender_balance_after_refund" [[
    (* TODO expression *) in
  ]] in
  do* [[ state.set_account_balance ~(|
    M.get_field ~(| env, "state" |),
    M.get_local ~(| "sender" |),
    M.get_local ~(| "sender_balance_after_refund" |)
  |) ]] in
  do* M.assign "coinbase_balance_after_mining_fee" [[
    (* TODO expression *) in
  ]] in
  do* [[ state.set_account_balance ~(|
    M.get_field ~(| env, "state" |),
    M.get_field ~(| env, "coinbase" |),
    M.get_local ~(| "coinbase_balance_after_mining_fee" |)
  |) ]] in
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.

Definition validate_transaction (tx : Transaction) : M bool :=
  (*
      Verifies a transaction.

      The gas in a transaction gets used to pay for the intrinsic cost of
      operations, therefore if there is insufficient gas then it would not
      be possible to execute a transaction and it will be declared invalid.

      Additionally, the nonce of a transaction must not equal or exceed the
      limit defined in `EIP-2681 <https://eips.ethereum.org/EIPS/eip-2681>`_.
      In practice, defining the limit as ``2**64-1`` has no impact because
      sending ``2**64-1`` transactions is improbable. It's not strictly
      impossible though, ``2**64-1`` transactions is the entire capacity of the
      Ethereum blockchain at 2022 gas limits for a little over 22 years.

      Parameters
      ----------
      tx :
          Transaction to validate.

      Returns
      -------
      verified : `bool`
          True if the transaction can be executed, or False otherwise.
      *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.

Definition calculate_intrinsic_cost (tx : Transaction) : M Uint :=
  (*
      Calculates the gas that is charged before execution is started.

      The intrinsic cost of the transaction is charged before execution has
      begun. Functions/operations in the EVM cost money to execute so this
      intrinsic cost is for the operations that need to be paid for as part of
      the transaction. Data transfer, for example, is part of this intrinsic
      cost. It costs ether to send data over the wire and that ether is
      accounted for in the intrinsic cost calculated in this function. This
      intrinsic cost must be calculated and paid for before execution in order
      for all operations to be implemented.

      Parameters
      ----------
      tx :
          Transaction to compute the intrinsic cost of.

      Returns
      -------
      verified : `ethereum.base_types.Uint`
          The intrinsic cost of the transaction.
      *)
  do* M.assign "data_cost" [[
    0 in
  ]] in
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.

Definition recover_sender (tx : Transaction) : M Address :=
  (*
      Extracts the sender address from a transaction.

      The v, r, and s values are the three parts that make up the signature
      of a transaction. In order to recover the sender of a transaction the two
      components needed are the signature (``v``, ``r``, and ``s``) and the
      signing hash of the transaction. The sender's public key can be obtained
      with these two values and therefore the sender address can be retrieved.

      Parameters
      ----------
      tx :
          Transaction of interest.

      Returns
      -------
      sender : `ethereum.fork_types.Address`
          The address of the account that signed the transaction.
      *)
  (* TODO assignment *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  do* M.assign "public_key" [[
    ethereum.crypto.elliptic_curve.secp256k1_recover ~(|
      M.get_local ~(| "r" |),
      M.get_local ~(| "s" |),
      (* TODO expression *),
      M.get_local ~(| "signing_hash" |) ~(|
        tx
      |)
    |) in
  ]] in
  (* TODO statement *)
  M.pure tt.

Definition signing_hash (tx : Transaction) : M Hash32 :=
  (*
      Compute the hash of a transaction used in the signature.

      The values that are used to compute the signing hash set the rules for a
      transaction. For example, signing over the gas sets a limit for the
      amount of money that is allowed to be pulled out of the sender's account.

      Parameters
      ----------
      tx :
          Transaction of interest.

      Returns
      -------
      hash : `ethereum.crypto.hash.Hash32`
          Hash of the transaction.
      *)
  (* TODO statement *)
  M.pure tt.

Definition compute_header_hash (header : Header) : M Hash32 :=
  (*
      Computes the hash of a block header.

      The header hash of a block is the canonical hash that is used to refer
      to a specific block and completely distinguishes a block from another.

      ``keccak256`` is a function that produces a 256 bit hash of any input.
      It also takes in any number of bytes as an input and produces a single
      hash for them. A hash is a completely unique output for a single input.
      So an input corresponds to one unique hash that can be used to identify
      the input exactly.

      Prior to using the ``keccak256`` hash function, the header must be
      encoded using the Recursive-Length Prefix. See :ref:`rlp`.
      RLP encoding the header converts it into a space-efficient format that
      allows for easy transfer of data between nodes. The purpose of RLP is to
      encode arbitrarily nested arrays of binary data, and RLP is the primary
      encoding method used to serialize objects in Ethereum's execution layer.
      The only purpose of RLP is to encode structure; encoding specific data
      types (e.g. strings, floats) is left up to higher-order protocols.

      Parameters
      ----------
      header :
          Header of interest.

      Returns
      -------
      hash : `ethereum.crypto.hash.Hash32`
          Hash of the header.
      *)
  (* TODO statement *)
  M.pure tt.

Definition check_gas_limit (gas_limit : Uint) (parent_gas_limit : Uint) : M bool :=
  (*
      Validates the gas limit for a block.

      The bounds of the gas limit, ``max_adjustment_delta``, is set as the
      quotient of the parent block's gas limit and the
      ``GAS_LIMIT_ADJUSTMENT_FACTOR``. Therefore, if the gas limit that is
      passed through as a parameter is greater than or equal to the *sum* of
      the parent's gas and the adjustment delta then the limit for gas is too
      high and fails this function's check. Similarly, if the limit is less
      than or equal to the *difference* of the parent's gas and the adjustment
      delta *or* the predefined ``GAS_LIMIT_MINIMUM`` then this function's
      check fails because the gas limit doesn't allow for a sufficient or
      reasonable amount of gas to be used on a block.

      Parameters
      ----------
      gas_limit :
          Gas limit to validate.

      parent_gas_limit :
          Gas limit of the parent block.

      Returns
      -------
      check : `bool`
          True if gas limit constraints are satisfied, False otherwise.
      *)
  do* M.assign "max_adjustment_delta" [[
    (* TODO expression *) in
  ]] in
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.

Definition calculate_block_difficulty (block_number : Uint) (block_timestamp : U256) (parent_timestamp : U256) (parent_difficulty : Uint) : M Uint :=
  (*
      Computes difficulty of a block using its header and parent header.

      The difficulty is determined by the time the block was created after its
      parent. The ``offset`` is calculated using the parent block's difficulty,
      ``parent_difficulty``, and the timestamp between blocks. This offset is
      then added to the parent difficulty and is stored as the ``difficulty``
      variable. If the time between the block and its parent is too short, the
      offset will result in a positive number thus making the sum of
      ``parent_difficulty`` and ``offset`` to be a greater value in order to
      avoid mass forking. But, if the time is long enough, then the offset
      results in a negative value making the block less difficult than
      its parent.

      The base standard for a block's difficulty is the predefined value
      set for the genesis block since it has no parent. So, a block
      can't be less difficult than the genesis block, therefore each block's
      difficulty is set to the maximum value between the calculated
      difficulty and the ``GENESIS_DIFFICULTY``.

      Parameters
      ----------
      block_number :
          Block number of the block.
      block_timestamp :
          Timestamp of the block.
      parent_timestamp :
          Timestamp of the parent block.
      parent_difficulty :
          difficulty of the parent block.

      Returns
      -------
      difficulty : `ethereum.base_types.Uint`
          Computed difficulty for a block.
      *)
  do* M.assign "offset" [[
    (* TODO expression *) in
  ]] in
  do* M.assign "difficulty" [[
    (* TODO expression *) in
  ]] in
  do* M.assign "num_bomb_periods" [[
    (* TODO expression *) in
  ]] in
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.
