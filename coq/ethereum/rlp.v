(*
.. _rlp:

Recursive Length Prefix (RLP) Encoding
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Defines the serialization and deserialization format used throughout Ethereum.
*)

Require dataclasses.
Require typing.
Require ethereum_types.bytes.
Require ethereum_types.numeric.
Require ethereum.crypto.hash.
Require ethereum.exceptions.

Definition encode : M unit :=
  (*
      Encodes `raw_data` into a sequence of bytes using RLP.

      Parameters
      ----------
      raw_data :
          A `Bytes`, `Uint`, `Uint256` or sequence of `RLP` encodable
          objects.

      Returns
      -------
      encoded : `ethereum.base_types.Bytes`
          The RLP encoded bytes representing `raw_data`.
      *)
  (* TODO statement *)


Definition encode_bytes : M unit :=
  (*
      Encodes `raw_bytes`, a sequence of bytes, using RLP.

      Parameters
      ----------
      raw_bytes :
          Bytes to encode with RLP.

      Returns
      -------
      encoded : `ethereum.base_types.Bytes`
          The RLP encoded bytes representing `raw_bytes`.
      *)
  let* len_raw_data := len (|
    raw_bytes
  |) in
  (* TODO statement *)


Definition encode_sequence : M unit :=
  (*
      Encodes a list of RLP encodable objects (`raw_sequence`) using RLP.

      Parameters
      ----------
      raw_sequence :
              Sequence of RLP encodable objects.

      Returns
      -------
      encoded : `ethereum.base_types.Bytes`
          The RLP encoded bytes representing `raw_sequence`.
      *)
  let* joined_encodings := get_joined_encodings (|
    raw_sequence
  |) in
  let* len_joined_encodings := len (|
    joined_encodings
  |) in
  (* TODO statement *)


Definition get_joined_encodings : M unit :=
  (*
      Obtain concatenation of rlp encoding for each item in the sequence
      raw_sequence.

      Parameters
      ----------
      raw_sequence :
          Sequence to encode with RLP.

      Returns
      -------
      joined_encodings : `ethereum.base_types.Bytes`
          The concatenated RLP encoded bytes for each item in sequence
          raw_sequence.
      *)
  (* TODO statement *)


Definition decode : M unit :=
  (*
      Decodes an integer, byte sequence, or list of RLP encodable objects
      from the byte sequence `encoded_data`, using RLP.

      Parameters
      ----------
      encoded_data :
          A sequence of bytes, in RLP form.

      Returns
      -------
      decoded_data : `RLP`
          Object decoded from `encoded_data`.
      *)
  (* TODO statement *)
  (* TODO statement *)


Definition decode_to : M unit :=
  (*
      Decode the bytes in `encoded_data` to an object of type `cls`. `cls` can be
      a `Bytes` subclass, a dataclass, `Uint`, `U256` or `Tuple[cls]`.

      Parameters
      ----------
      cls: `Type[U]`
          The type to decode to.
      encoded_data :
          A sequence of bytes, in RLP form.

      Returns
      -------
      decoded_data : `U`
          Object decoded from `encoded_data`.
      *)
  let* decoded := decode (|
    encoded_data
  |) in
  (* TODO statement *)


Definition _deserialize_to : M unit :=
  (* TODO statement *)


Definition _deserialize_to : M unit :=
  (* TODO statement *)


Definition _deserialize_to : M unit :=
  (* TODO statement *)


Definition _deserialize_to_dataclass : M unit :=
  (* TODO statement *)
  let* hints := typing.get_type_hints (|
    cls
  |) in
  let* target_fields := dataclasses.fields (|
    cls
  |) in
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  let* result := cls (|

  |) in
  (* TODO statement *)
  (* TODO statement *)


Definition _deserialize_to_bool : M unit :=
  (* TODO statement *)


Definition _deserialize_to_bytes : M unit :=
  (* TODO statement *)
  (* TODO statement *)


Definition _deserialize_to_uint : M unit :=
  (* TODO statement *)
  (* TODO statement *)


Definition _deserialize_to_annotation : M unit :=
  let* origin := typing.get_origin (|
    annotation
  |) in
  (* TODO statement *)


Definition _deserialize_to_union : M unit :=
  let* arguments := typing.get_args (|
    annotation
  |) in
  let* successes := (* TODO expression *) in
  let* failures := (* TODO expression *) in
  (* TODO statement *)
  (* TODO statement *)


Definition _deserialize_to_tuple : M unit :=
  (* TODO statement *)
  let* arguments := list (|
    typing.get_args (|
      annotation
    |)
  |) in
  (* TODO statement *)
  let* decoded := (* TODO expression *) in
  (* TODO statement *)
  (* TODO statement *)


Definition decode_to_bytes : M unit :=
  (*
      Decodes a rlp encoded byte stream assuming that the decoded data
      should be of type `bytes`.

      Parameters
      ----------
      encoded_bytes :
          RLP encoded byte stream.

      Returns
      -------
      decoded : `ethereum.base_types.Bytes`
          RLP decoded Bytes data
      *)
  (* TODO statement *)


Definition decode_to_sequence : M unit :=
  (*
      Decodes a rlp encoded byte stream assuming that the decoded data
      should be of type `Sequence` of objects.

      Parameters
      ----------
      encoded_sequence :
          An RLP encoded Sequence.

      Returns
      -------
      decoded : `Sequence[RLP]`
          Sequence of objects decoded from `encoded_sequence`.
      *)
  (* TODO statement *)
  (* TODO statement *)


Definition decode_joined_encodings : M unit :=
  (*
      Decodes `joined_encodings`, which is a concatenation of RLP encoded
      objects.

      Parameters
      ----------
      joined_encodings :
          concatenation of RLP encoded objects

      Returns
      -------
      decoded : `List[RLP]`
          A list of objects decoded from `joined_encodings`.
      *)
  let* decoded_sequence := (* TODO expression *) in
  let* item_start_idx := (* TODO expression *) in
  (* TODO statement *)
  (* TODO statement *)


Definition decode_item_length : M unit :=
  (*
      Find the length of the rlp encoding for the first object in the
      encoded sequence.
      Here `encoded_data` refers to concatenation of rlp encoding for each
      item in a sequence.

      NOTE - This is a helper function not described in the spec. It was
      introduced as the spec doesn't discuss about decoding the RLP encoded
      data.

      Parameters
      ----------
      encoded_data :
          RLP encoded data for a sequence of objects.

      Returns
      -------
      rlp_length : `int`
      *)
  (* TODO statement *)
  let* first_rlp_byte := (* TODO expression *) in
  let* length_length := (* TODO expression *) in
  let* decoded_data_length := (* TODO expression *) in
  (* TODO statement *)
  (* TODO statement *)


Definition rlp_hash : M unit :=
  (*
      Obtain the keccak-256 hash of the rlp encoding of the passed in data.

      Parameters
      ----------
      data :
          The data for which we need the rlp hash.

      Returns
      -------
      hash : `Hash32`
          The rlp hash of the passed in data.
      *)
  (* TODO statement *)

