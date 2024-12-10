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
Require arrow_glacier.fork_types.
Require arrow_glacier.trie.

Definition close_state : M unit :=
  (*
      Free resources held by the state. Used by optimized implementations to
      release file descriptors.
      *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)


Definition begin_transaction : M unit :=
  (*
      Start a state transaction.

      Transactions are entirely implicit and can be nested. It is not possible to
      calculate the state root during a transaction.

      Parameters
      ----------
      state : State
          The state.
      *)
  do* state.["_snapshots"].["append"] (|
    (* TODO expression *)
  |) in


Definition commit_transaction : M unit :=
  (*
      Commit a state transaction.

      Parameters
      ----------
      state : State
          The state.
      *)
  do* state.["_snapshots"].["pop"] (|

  |) in
  (* TODO statement *)


Definition rollback_transaction : M unit :=
  (*
      Rollback a state transaction, resetting the state to the point when the
      corresponding `start_transaction()` call was made.

      Parameters
      ----------
      state : State
          The state.
      *)
  (* TODO assignment *)
  (* TODO statement *)


Definition get_account : M unit :=
  (*
      Get the `Account` object at an address. Returns `EMPTY_ACCOUNT` if there
      is no account at the address.

      Use `get_account_optional()` if you care about the difference between a
      non-existent account and `EMPTY_ACCOUNT`.

      Parameters
      ----------
      state: `State`
          The state
      address : `Address`
          Address to lookup.

      Returns
      -------
      account : `Account`
          Account at address.
      *)
  let* account := get_account_optional (|
    state,
    address
  |) in
  (* TODO statement *)


Definition get_account_optional : M unit :=
  (*
      Get the `Account` object at an address. Returns `None` (rather than
      `EMPTY_ACCOUNT`) if there is no account at the address.

      Parameters
      ----------
      state: `State`
          The state
      address : `Address`
          Address to lookup.

      Returns
      -------
      account : `Account`
          Account at address.
      *)
  let* account := trie.trie_get (|
    state.["_main_trie"],
    address
  |) in
  (* TODO statement *)


Definition set_account : M unit :=
  (*
      Set the `Account` object at an address. Setting to `None` deletes
      the account (but not its storage, see `destroy_account()`).

      Parameters
      ----------
      state: `State`
          The state
      address : `Address`
          Address to set.
      account : `Account`
          Account to set at address.
      *)
  do* trie.trie_set (|
    state.["_main_trie"],
    address,
    account
  |) in


Definition destroy_account : M unit :=
  (*
      Completely remove the account at `address` and all of its storage.

      This function is made available exclusively for the `SELFDESTRUCT`
      opcode. It is expected that `SELFDESTRUCT` will be disabled in a future
      hardfork and this function will be removed.

      Parameters
      ----------
      state: `State`
          The state
      address : `Address`
          Address of account to destroy.
      *)
  do* destroy_storage (|
    state,
    address
  |) in
  do* set_account (|
    state,
    address,
    (* TODO expression *)
  |) in


Definition destroy_storage : M unit :=
  (*
      Completely remove the storage at `address`.

      Parameters
      ----------
      state: `State`
          The state
      address : `Address`
          Address of account whose storage is to be deleted.
      *)
  (* TODO statement *)


Definition mark_account_created : M unit :=
  (*
      Mark an account as having been created in the current transaction.
      This information is used by `get_storage_original()` to handle an obscure
      edgecase.

      The marker is not removed even if the account creation reverts. Since the
      account cannot have had code prior to its creation and can't call
      `get_storage_original()`, this is harmless.

      Parameters
      ----------
      state: `State`
          The state
      address : `Address`
          Address of the account that has been created.
      *)
  do* state.["created_accounts"].["add"] (|
    address
  |) in


Definition get_storage : M unit :=
  (*
      Get a value at a storage key on an account. Returns `U256(0)` if the
      storage key has not been set previously.

      Parameters
      ----------
      state: `State`
          The state
      address : `Address`
          Address of the account.
      key : `Bytes`
          Key to lookup.

      Returns
      -------
      value : `U256`
          Value at the key.
      *)
  let* trie := state.["_storage_tries"].["get"] (|
    address
  |) in
  (* TODO statement *)
  let* value := trie.trie_get (|
    trie,
    key
  |) in
  (* TODO statement *)
  (* TODO statement *)


Definition set_storage : M unit :=
  (*
      Set a value at a storage key on an account. Setting to `U256(0)` deletes
      the key.

      Parameters
      ----------
      state: `State`
          The state
      address : `Address`
          Address of the account.
      key : `Bytes`
          Key to set.
      value : `U256`
          Value to set at the key.
      *)
  (* TODO statement *)
  let* trie := state.["_storage_tries"].["get"] (|
    address
  |) in
  (* TODO statement *)
  do* trie.trie_set (|
    trie,
    key,
    value
  |) in
  (* TODO statement *)


Definition storage_root : M unit :=
  (*
      Calculate the storage root of an account.

      Parameters
      ----------
      state:
          The state
      address :
          Address of the account.

      Returns
      -------
      root : `Root`
          Storage root of the account.
      *)
  (* TODO statement *)
  (* TODO statement *)


Definition state_root : M unit :=
  (*
      Calculate the state root.

      Parameters
      ----------
      state:
          The current state.

      Returns
      -------
      root : `Root`
          The state root.
      *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)


Definition account_exists : M unit :=
  (*
      Checks if an account exists in the state trie

      Parameters
      ----------
      state:
          The state
      address:
          Address of the account that needs to be checked.

      Returns
      -------
      account_exists : `bool`
          True if account exists in the state trie, False otherwise
      *)
  (* TODO statement *)


Definition account_has_code_or_nonce : M unit :=
  (*
      Checks if an account has non zero nonce or non empty code

      Parameters
      ----------
      state:
          The state
      address:
          Address of the account that needs to be checked.

      Returns
      -------
      has_code_or_nonce : `bool`
          True if if an account has non zero nonce or non empty code,
          False otherwise.
      *)
  let* account := get_account (|
    state,
    address
  |) in
  (* TODO statement *)


Definition is_account_empty : M unit :=
  (*
      Checks if an account has zero nonce, empty code and zero balance.

      Parameters
      ----------
      state:
          The state
      address:
          Address of the account that needs to be checked.

      Returns
      -------
      is_empty : `bool`
          True if if an account has zero nonce, empty code and zero balance,
          False otherwise.
      *)
  let* account := get_account (|
    state,
    address
  |) in
  (* TODO statement *)


Definition account_exists_and_is_empty : M unit :=
  (*
      Checks if an account exists and has zero nonce, empty code and zero
      balance.

      Parameters
      ----------
      state:
          The state
      address:
          Address of the account that needs to be checked.

      Returns
      -------
      exists_and_is_empty : `bool`
          True if an account exists and has zero nonce, empty code and zero
          balance, False otherwise.
      *)
  let* account := get_account_optional (|
    state,
    address
  |) in
  (* TODO statement *)


Definition is_account_alive : M unit :=
  (*
      Check whether is an account is both in the state and non empty.

      Parameters
      ----------
      state:
          The state
      address:
          Address of the account that needs to be checked.

      Returns
      -------
      is_alive : `bool`
          True if the account is alive.
      *)
  let* account := get_account_optional (|
    state,
    address
  |) in
  (* TODO statement *)


Definition modify_state : M unit :=
  (*
      Modify an `Account` in the `State`.
      *)
  do* set_account (|
    state,
    address,
    ethereum_types.frozen.modify (|
      get_account (|
        state,
        address
      |),
      f
    |)
  |) in


Definition move_ether : M unit :=
  (*
      Move funds between accounts.
      *)
  (* TODO statement *)
  (* TODO statement *)
  do* modify_state (|
    state,
    sender_address,
    reduce_sender_balance
  |) in
  do* modify_state (|
    state,
    recipient_address,
    increase_recipient_balance
  |) in


Definition set_account_balance : M unit :=
  (*
      Sets the balance of an account.

      Parameters
      ----------
      state:
          The current state.

      address:
          Address of the account whose nonce needs to be incremented.

      amount:
          The amount that needs to set in balance.
      *)
  (* TODO statement *)
  do* modify_state (|
    state,
    address,
    set_balance
  |) in


Definition touch_account : M unit :=
  (*
      Initializes an account to state.

      Parameters
      ----------
      state:
          The current state.

      address:
          The address of the account that need to initialised.
      *)
  (* TODO statement *)


Definition increment_nonce : M unit :=
  (*
      Increments the nonce of an account.

      Parameters
      ----------
      state:
          The current state.

      address:
          Address of the account whose nonce needs to be incremented.
      *)
  (* TODO statement *)
  do* modify_state (|
    state,
    address,
    increase_nonce
  |) in


Definition set_code : M unit :=
  (*
      Sets Account code.

      Parameters
      ----------
      state:
          The current state.

      address:
          Address of the account whose code needs to be update.

      code:
          The bytecode that needs to be set.
      *)
  (* TODO statement *)
  do* modify_state (|
    state,
    address,
    write_code
  |) in


Definition create_ether : M unit :=
  (*
      Add newly created ether to an account.

      Parameters
      ----------
      state:
          The current state.
      address:
          Address of the account to which ether is added.
      amount:
          The amount of ether to be added to the account of interest.
      *)
  (* TODO statement *)
  do* modify_state (|
    state,
    address,
    increase_balance
  |) in


Definition get_storage_original : M unit :=
  (*
      Get the original value in a storage slot i.e. the value before the current
      transaction began. This function reads the value from the snapshots taken
      before executing the transaction.

      Parameters
      ----------
      state:
          The current state.
      address:
          Address of the account to read the value from.
      key:
          Key of the storage slot.
      *)
  (* TODO statement *)
  (* TODO assignment *)
  let* original_account_trie := original_trie.["get"] (|
    address
  |) in
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)

