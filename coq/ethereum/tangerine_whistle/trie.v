(* Generated *)
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


Definition encode_internal_node (node : (* TODO type *)) : M (* TODO type *) :=
  (*
      Encodes a Merkle Trie node into its RLP form. The RLP will then be
      serialized into a `Bytes` and hashed unless it is less that 32 bytes
      when serialized.

      This function also accepts `None`, representing the absence of a node,
      which is encoded to `b""`.

      Parameters
      ----------
      node : Optional[InternalNode]
          The node to encode.

      Returns
      -------
      encoded : `rlp.Extended`
          The node encoded as RLP.
      *)
  (* TODO statement *)
  (* TODO statement *)
  do* M.assign "encoded" [[
    M.get_field ~(| M.get_local ~(| "rlp" |), "encode" |) ~(|
      M.get_local ~(| "unencoded" |)
    |) in
  ]] in
  (* TODO statement *)
  M.pure tt.

Definition encode_node (node : Node) (storage_root : (* TODO type *)) : M Bytes :=
  (*
      Encode a Node for storage in the Merkle Trie.

      Currently mostly an unimplemented stub.
      *)
  (* TODO statement *)
  M.pure tt.

Definition copy_trie (trie : (* TODO type *)) : M (* TODO type *) :=
  (*
      Create a copy of `trie`. Since only frozen objects may be stored in tries,
      the contents are reused.

      Parameters
      ----------
      trie: `Trie`
          Trie to copy.

      Returns
      -------
      new_trie : `Trie[K, V]`
          A copy of the trie.
      *)
  (* TODO statement *)
  M.pure tt.

Definition trie_set (trie : (* TODO type *)) (key : K) (value : V) : M unit :=
  (*
      Stores an item in a Merkle Trie.

      This method deletes the key if `value == trie.default`, because the Merkle
      Trie represents the default value by omitting it from the trie.

      Parameters
      ----------
      trie: `Trie`
          Trie to store in.
      key : `Bytes`
          Key to lookup.
      value : `V`
          Node to insert at `key`.
      *)
  (* TODO statement *)
  M.pure tt.

Definition trie_get (trie : (* TODO type *)) (key : K) : M V :=
  (*
      Gets an item from the Merkle Trie.

      This method returns `trie.default` if the key is missing.

      Parameters
      ----------
      trie:
          Trie to lookup in.
      key :
          Key to lookup.

      Returns
      -------
      node : `V`
          Node at `key` in the trie.
      *)
  (* TODO statement *)
  M.pure tt.

Definition common_prefix_length (a : Sequence) (b : Sequence) : M int :=
  (*
      Find the longest common prefix of two sequences.
      *)
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.

Definition nibble_list_to_compact (x : Bytes) (is_leaf : bool) : M Bytes :=
  (*
      Compresses nibble-list into a standard byte array with a flag.

      A nibble-list is a list of byte values no greater than `15`. The flag is
      encoded in high nibble of the highest byte. The flag nibble can be broken
      down into two two-bit flags.

      Highest nibble::

          +---+---+----------+--------+
          | _ | _ | is_leaf | parity |
          +---+---+----------+--------+
            3   2      1         0


      The lowest bit of the nibble encodes the parity of the length of the
      remaining nibbles -- `0` when even and `1` when odd. The second lowest bit
      is used to distinguish leaf and extension nodes. The other two bits are not
      used.

      Parameters
      ----------
      x :
          Array of nibbles.
      is_leaf :
          True if this is part of a leaf node, or false if it is an extension
          node.

      Returns
      -------
      compressed : `bytearray`
          Compact byte array.
      *)
  do* M.assign "compact" [[
    M.get_local ~(| "bytearray" |) ~(|

    |) in
  ]] in
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.

Definition bytes_to_nibble_list (bytes_ : Bytes) : M Bytes :=
  (*
      Converts a `Bytes` into to a sequence of nibbles (bytes with value < 16).

      Parameters
      ----------
      bytes_:
          The `Bytes` to convert.

      Returns
      -------
      nibble_list : `Bytes`
          The `Bytes` in nibble-list format.
      *)
  do* M.assign "nibble_list" [[
    M.get_local ~(| "bytearray" |) ~(|
      (* TODO expression *)
    |) in
  ]] in
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.

Definition _prepare_trie (trie : (* TODO type *)) (get_storage_root : (* TODO type *)) : M (* TODO type *) :=
  (*
      Prepares the trie for root calculation. Removes values that are empty,
      hashes the keys (if `secured == True`) and encodes all the nodes.

      Parameters
      ----------
      trie :
          The `Trie` to prepare.
      get_storage_root :
          Function to get the storage root of an account. Needed to encode
          `Account` objects.

      Returns
      -------
      out : `Mapping[ethereum.base_types.Bytes, Node]`
          Object with keys mapped to nibble-byte form.
      *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.

Definition root (trie : (* TODO type *)) (get_storage_root : (* TODO type *)) : M Root :=
  (*
      Computes the root of a modified merkle patricia trie (MPT).

      Parameters
      ----------
      trie :
          `Trie` to get the root of.
      get_storage_root :
          Function to get the storage root of an account. Needed to encode
          `Account` objects.


      Returns
      -------
      root : `.fork_types.Root`
          MPT root of the underlying key-value pairs.
      *)
  do* M.assign "obj" [[
    M.get_local ~(| "_prepare_trie" |) ~(|
      trie,
      get_storage_root
    |) in
  ]] in
  do* M.assign "root_node" [[
    M.get_local ~(| "encode_internal_node" |) ~(|
      M.get_local ~(| "patricialize" |) ~(|
        M.get_local ~(| "obj" |),
        M.get_local ~(| "Uint" |) ~(|
          0
        |)
      |)
    |) in
  ]] in
  (* TODO statement *)
  M.pure tt.

Definition patricialize (obj : (* TODO type *)) (level : Uint) : M (* TODO type *) :=
  (*
      Structural composition function.

      Used to recursively patricialize and merkleize a dictionary. Includes
      memoization of the tree structure and hashes.

      Parameters
      ----------
      obj :
          Underlying trie key-value pairs, with keys in nibble-list format.
      level :
          Current trie level.

      Returns
      -------
      node : `ethereum.base_types.Bytes`
          Root node of `obj`.
      *)
  (* TODO statement *)
  do* M.assign "arbitrary_key" [[
    M.get_local ~(| "next" |) ~(|
      M.get_local ~(| "iter" |) ~(|
        obj
      |)
    |) in
  ]] in
  (* TODO statement *)
  do* M.assign "substring" [[
    (* TODO expression *) in
  ]] in
  do* M.assign "prefix_length" [[
    M.get_local ~(| "len" |) ~(|
      M.get_local ~(| "substring" |)
    |) in
  ]] in
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  do* M.assign "value" [[
    (* TODO constant *) in
  ]] in
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.
