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


Definition encode_internal_node : M unit :=
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
      encoded : `rlp.RLP`
          The node encoded as RLP.
      *)
  (* TODO statement *)
  (* TODO statement *)
  let* encoded := rlp.["encode"] (|
    unencoded
  |) in
  (* TODO statement *)


Definition encode_node : M unit :=
  (*
      Encode a Node for storage in the Merkle Trie.

      Currently mostly an unimplemented stub.
      *)
  (* TODO statement *)


Definition copy_trie : M unit :=
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


Definition trie_set : M unit :=
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


Definition trie_get : M unit :=
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


Definition common_prefix_length : M unit :=
  (*
      Find the longest common prefix of two sequences.
      *)
  (* TODO statement *)
  (* TODO statement *)


Definition nibble_list_to_compact : M unit :=
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
  let* compact := bytearray (|

  |) in
  (* TODO statement *)
  (* TODO statement *)


Definition bytes_to_nibble_list : M unit :=
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
  let* nibble_list := bytearray (|
    (* TODO expression *)
  |) in
  (* TODO statement *)
  (* TODO statement *)


Definition _prepare_trie : M unit :=
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


Definition root : M unit :=
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
      root : `eth1spec.fork_types.Root`
          MPT root of the underlying key-value pairs.
      *)
  let* obj := _prepare_trie (|
    trie,
    get_storage_root
  |) in
  let* root_node := encode_internal_node (|
    patricialize (|
      obj,
      Uint (|
        (* TODO expression *)
      |)
    |)
  |) in
  (* TODO statement *)


Definition patricialize : M unit :=
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
      node : `eth1spec.base_types.Bytes`
          Root node of `obj`.
      *)
  (* TODO statement *)
  let* arbitrary_key := next (|
    iter (|
      obj
    |)
  |) in
  (* TODO statement *)
  let* substring := (* TODO expression *) in
  let* prefix_length := len (|
    substring
  |) in
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  let* value := (* TODO expression *) in
  (* TODO statement *)
  (* TODO statement *)

