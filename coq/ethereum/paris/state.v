(* Generated *)
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
Require ethereum.paris.fork_types.
Require ethereum.paris.trie.

Definition close_state (state : State) : M unit :=
  (*
      Free resources held by the state. Used by optimized implementations to
      release file descriptors.
      *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.

Definition begin_transaction (state : State) : M unit :=
  (*
      Start a state transaction.

      Transactions are entirely implicit and can be nested. It is not possible to
      calculate the state root during a transaction.

      Parameters
      ----------
      state : State
          The state.
      *)
  do* [[ M.get_field ~(| M.get_field ~(| state, "_snapshots" |), "append" |) ~(|
    (* TODO expression *)
  |) ]] in
  M.pure tt.

Definition commit_transaction (state : State) : M unit :=
  (*
      Commit a state transaction.

      Parameters
      ----------
      state : State
          The state.
      *)
  do* [[ M.get_field ~(| M.get_field ~(| state, "_snapshots" |), "pop" |) ~(|

  |) ]] in
  (* TODO statement *)
  M.pure tt.

Definition rollback_transaction (state : State) : M unit :=
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
  M.pure tt.

Definition get_account (state : State) (address : Address) : M Account :=
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
  do* M.assign "account" [[
    M.get_local ~(| "get_account_optional" |) ~(|
      state,
      address
    |) in
  ]] in
  (* TODO statement *)
  M.pure tt.

Definition get_account_optional (state : State) (address : Address) : M (* TODO type *) :=
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
  do* M.assign "account" [[
    trie.trie_get ~(|
      M.get_field ~(| state, "_main_trie" |),
      address
    |) in
  ]] in
  (* TODO statement *)
  M.pure tt.

Definition set_account (state : State) (address : Address) (account : (* TODO type *)) : M unit :=
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
  do* [[ trie.trie_set ~(|
    M.get_field ~(| state, "_main_trie" |),
    address,
    account
  |) ]] in
  M.pure tt.

Definition destroy_account (state : State) (address : Address) : M unit :=
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
  do* [[ M.get_local ~(| "destroy_storage" |) ~(|
    state,
    address
  |) ]] in
  do* [[ M.get_local ~(| "set_account" |) ~(|
    state,
    address,
    tt
  |) ]] in
  M.pure tt.

Definition destroy_storage (state : State) (address : Address) : M unit :=
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
  M.pure tt.

Definition mark_account_created (state : State) (address : Address) : M unit :=
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
  do* [[ M.get_field ~(| M.get_field ~(| state, "created_accounts" |), "add" |) ~(|
    address
  |) ]] in
  M.pure tt.

Definition get_storage (state : State) (address : Address) (key : Bytes) : M U256 :=
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
  do* M.assign "trie" [[
    M.get_field ~(| M.get_field ~(| state, "_storage_tries" |), "get" |) ~(|
      address
    |) in
  ]] in
  (* TODO statement *)
  do* M.assign "value" [[
    trie.trie_get ~(|
      M.get_local ~(| "trie" |),
      key
    |) in
  ]] in
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.

Definition set_storage (state : State) (address : Address) (key : Bytes) (value : U256) : M unit :=
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
  do* M.assign "trie" [[
    M.get_field ~(| M.get_field ~(| state, "_storage_tries" |), "get" |) ~(|
      address
    |) in
  ]] in
  (* TODO statement *)
  do* [[ trie.trie_set ~(|
    M.get_local ~(| "trie" |),
    key,
    value
  |) ]] in
  (* TODO statement *)
  M.pure tt.

Definition storage_root (state : State) (address : Address) : M Root :=
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
  M.pure tt.

Definition state_root (state : State) : M Root :=
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
  M.pure tt.

Definition account_exists (state : State) (address : Address) : M bool :=
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
  M.pure tt.

Definition account_has_code_or_nonce (state : State) (address : Address) : M bool :=
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
  do* M.assign "account" [[
    M.get_local ~(| "get_account" |) ~(|
      state,
      address
    |) in
  ]] in
  (* TODO statement *)
  M.pure tt.

Definition is_account_empty (state : State) (address : Address) : M bool :=
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
  do* M.assign "account" [[
    M.get_local ~(| "get_account" |) ~(|
      state,
      address
    |) in
  ]] in
  (* TODO statement *)
  M.pure tt.

Definition account_exists_and_is_empty (state : State) (address : Address) : M bool :=
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
  do* M.assign "account" [[
    M.get_local ~(| "get_account_optional" |) ~(|
      state,
      address
    |) in
  ]] in
  (* TODO statement *)
  M.pure tt.

Definition is_account_alive (state : State) (address : Address) : M bool :=
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
  do* M.assign "account" [[
    M.get_local ~(| "get_account_optional" |) ~(|
      state,
      address
    |) in
  ]] in
  (* TODO statement *)
  M.pure tt.

Definition modify_state (state : State) (address : Address) (f : (* TODO type *)) : M unit :=
  (*
      Modify an `Account` in the `State`.
      *)
  do* [[ M.get_local ~(| "set_account" |) ~(|
    state,
    address,
    ethereum_types.frozen.modify ~(|
      M.get_local ~(| "get_account" |) ~(|
        state,
        address
      |),
      f
    |)
  |) ]] in
  M.pure tt.

Definition move_ether (state : State) (sender_address : Address) (recipient_address : Address) (amount : U256) : M unit :=
  (*
      Move funds between accounts.
      *)
  (* TODO statement *)
  (* TODO statement *)
  do* [[ M.get_local ~(| "modify_state" |) ~(|
    state,
    sender_address,
    M.get_local ~(| "reduce_sender_balance" |)
  |) ]] in
  do* [[ M.get_local ~(| "modify_state" |) ~(|
    state,
    recipient_address,
    M.get_local ~(| "increase_recipient_balance" |)
  |) ]] in
  M.pure tt.

Definition set_account_balance (state : State) (address : Address) (amount : U256) : M unit :=
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
  do* [[ M.get_local ~(| "modify_state" |) ~(|
    state,
    address,
    M.get_local ~(| "set_balance" |)
  |) ]] in
  M.pure tt.

Definition touch_account (state : State) (address : Address) : M unit :=
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
  M.pure tt.

Definition increment_nonce (state : State) (address : Address) : M unit :=
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
  do* [[ M.get_local ~(| "modify_state" |) ~(|
    state,
    address,
    M.get_local ~(| "increase_nonce" |)
  |) ]] in
  M.pure tt.

Definition set_code (state : State) (address : Address) (code : Bytes) : M unit :=
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
  do* [[ M.get_local ~(| "modify_state" |) ~(|
    state,
    address,
    M.get_local ~(| "write_code" |)
  |) ]] in
  M.pure tt.

Definition get_storage_original (state : State) (address : Address) (key : Bytes) : M U256 :=
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
  do* M.assign "original_account_trie" [[
    M.get_field ~(| M.get_local ~(| "original_trie" |), "get" |) ~(|
      address
    |) in
  ]] in
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.
