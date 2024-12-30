(* Generated *)
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

Definition encode (raw_data : Extended) : M Bytes :=
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
  M.pure tt.

Definition encode_bytes (raw_bytes : Bytes) : M Bytes :=
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
  do* M.assign "len_raw_data" [[
    M.get_local ~(| "len" |) ~(|
      raw_bytes
    |) in
  ]] in
  (* TODO statement *)
  M.pure tt.

Definition encode_sequence (raw_sequence : (* TODO type *)) : M Bytes :=
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
  do* M.assign "joined_encodings" [[
    M.get_local ~(| "get_joined_encodings" |) ~(|
      raw_sequence
    |) in
  ]] in
  do* M.assign "len_joined_encodings" [[
    M.get_local ~(| "len" |) ~(|
      M.get_local ~(| "joined_encodings" |)
    |) in
  ]] in
  (* TODO statement *)
  M.pure tt.

Definition get_joined_encodings (raw_sequence : (* TODO type *)) : M Bytes :=
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
  M.pure tt.

Definition decode (encoded_data : Bytes) : M Simple :=
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
  M.pure tt.

Definition decode_to (cls : (* TODO type *)) (encoded_data : Bytes) : M U :=
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
  do* M.assign "decoded" [[
    M.get_local ~(| "decode" |) ~(|
      encoded_data
    |) in
  ]] in
  (* TODO statement *)
  M.pure tt.

Definition _deserialize_to (class_ : (* TODO type *)) (value : Simple) : M U :=
  (* TODO statement *)
  M.pure tt.

Definition _deserialize_to (class_ : object) (value : Simple) : M Extended :=
  (* TODO statement *)
  M.pure tt.

Definition _deserialize_to (class_ : object) (value : Simple) : M Extended :=
  (* TODO statement *)
  M.pure tt.

Definition _deserialize_to_dataclass (cls : (* TODO type *)) (decoded : Simple) : M U :=
  (* TODO statement *)
  do* M.assign "hints" [[
    typing.get_type_hints ~(|
      cls
    |) in
  ]] in
  do* M.assign "target_fields" [[
    dataclasses.fields ~(|
      cls
    |) in
  ]] in
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  do* M.assign "result" [[
    cls ~(|

    |) in
  ]] in
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.

Definition _deserialize_to_bool (value : Simple) : M bool :=
  (* TODO statement *)
  M.pure tt.

Definition _deserialize_to_bytes (class_ : (* TODO type *)) (value : Simple) : M (* TODO type *) :=
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.

Definition _deserialize_to_uint (class_ : (* TODO type *)) (decoded : Simple) : M (* TODO type *) :=
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.

Definition _deserialize_to_annotation (annotation : object) (value : Simple) : M Extended :=
  do* M.assign "origin" [[
    typing.get_origin ~(|
      annotation
    |) in
  ]] in
  (* TODO statement *)
  M.pure tt.

Definition _deserialize_to_union (annotation : object) (value : Simple) : M Extended :=
  do* M.assign "arguments" [[
    typing.get_args ~(|
      annotation
    |) in
  ]] in
  do* M.assign "successes" [[
    (* TODO expression *) in
  ]] in
  do* M.assign "failures" [[
    (* TODO expression *) in
  ]] in
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.

Definition _deserialize_to_tuple (annotation : object) (values : Simple) : M (* TODO type *) :=
  (* TODO statement *)
  do* M.assign "arguments" [[
    M.get_local ~(| "list" |) ~(|
      typing.get_args ~(|
        annotation
      |)
    |) in
  ]] in
  (* TODO statement *)
  do* M.assign "decoded" [[
    (* TODO expression *) in
  ]] in
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.

Definition decode_to_bytes (encoded_bytes : Bytes) : M Bytes :=
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
  M.pure tt.

Definition decode_to_sequence (encoded_sequence : Bytes) : M (* TODO type *) :=
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
  M.pure tt.

Definition decode_joined_encodings (joined_encodings : Bytes) : M (* TODO type *) :=
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
  do* M.assign "decoded_sequence" [[
    (* TODO expression *) in
  ]] in
  do* M.assign "item_start_idx" [[
    0 in
  ]] in
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.

Definition decode_item_length (encoded_data : Bytes) : M int :=
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
  do* M.assign "first_rlp_byte" [[
    (* TODO expression *) in
  ]] in
  do* M.assign "length_length" [[
    0 in
  ]] in
  do* M.assign "decoded_data_length" [[
    0 in
  ]] in
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.

Definition rlp_hash (data : Extended) : M Hash32 :=
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
  M.pure tt.
