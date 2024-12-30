(* Generated *)
(*
Utility Functions For Hexadecimal Strings
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Hexadecimal strings specific utility functions used in this specification.
*)

Require ethereum_types.bytes.
Require ethereum_types.numeric.
Require ethereum.crypto.hash.

Definition has_hex_prefix (hex_string : str) : M bool :=
  (*
      Check if a hex string starts with hex prefix (0x).

      Parameters
      ----------
      hex_string :
          The hexadecimal string to be checked for presence of prefix.

      Returns
      -------
      has_prefix : `bool`
          Boolean indicating whether the hex string has 0x prefix.
      *)
  (* TODO statement *)
  M.pure tt.

Definition remove_hex_prefix (hex_string : str) : M str :=
  (*
      Remove 0x prefix from a hex string if present. This function returns the
      passed hex string if it isn't prefixed with 0x.

      Parameters
      ----------
      hex_string :
          The hexadecimal string whose prefix is to be removed.

      Returns
      -------
      modified_hex_string : `str`
          The hexadecimal string with the 0x prefix removed if present.
      *)
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.

Definition hex_to_bytes (hex_string : str) : M Bytes :=
  (*
      Convert hex string to bytes.

      Parameters
      ----------
      hex_string :
          The hexadecimal string to be converted to bytes.

      Returns
      -------
      byte_stream : `bytes`
          Byte stream corresponding to the given hexadecimal string.
      *)
  (* TODO statement *)
  M.pure tt.

Definition hex_to_bytes8 (hex_string : str) : M Bytes8 :=
  (*
      Convert hex string to 8 bytes.

      Parameters
      ----------
      hex_string :
          The hexadecimal string to be converted to 8 bytes.

      Returns
      -------
      8_byte_stream : `Bytes8`
          8-byte stream corresponding to the given hexadecimal string.
      *)
  (* TODO statement *)
  M.pure tt.

Definition hex_to_bytes20 (hex_string : str) : M Bytes20 :=
  (*
      Convert hex string to 20 bytes.

      Parameters
      ----------
      hex_string :
          The hexadecimal string to be converted to 20 bytes.

      Returns
      -------
      20_byte_stream : `Bytes20`
          20-byte stream corresponding to the given hexadecimal string.
      *)
  (* TODO statement *)
  M.pure tt.

Definition hex_to_bytes32 (hex_string : str) : M Bytes32 :=
  (*
      Convert hex string to 32 bytes.

      Parameters
      ----------
      hex_string :
          The hexadecimal string to be converted to 32 bytes.

      Returns
      -------
      32_byte_stream : `Bytes32`
          32-byte stream corresponding to the given hexadecimal string.
      *)
  (* TODO statement *)
  M.pure tt.

Definition hex_to_bytes256 (hex_string : str) : M Bytes256 :=
  (*
      Convert hex string to 256 bytes.

      Parameters
      ----------
      hex_string :
          The hexadecimal string to be converted to 256 bytes.

      Returns
      -------
      256_byte_stream : `Bytes256`
          256-byte stream corresponding to the given hexadecimal string.
      *)
  (* TODO statement *)
  M.pure tt.

Definition hex_to_hash (hex_string : str) : M Hash32 :=
  (*
      Convert hex string to hash32 (32 bytes).

      Parameters
      ----------
      hex_string :
          The hexadecimal string to be converted to hash32.

      Returns
      -------
      hash : `Hash32`
          32-byte stream obtained from the given hexadecimal string.
      *)
  (* TODO statement *)
  M.pure tt.

Definition hex_to_uint (hex_string : str) : M Uint :=
  (*
      Convert hex string to Uint.

      Parameters
      ----------
      hex_string :
          The hexadecimal string to be converted to Uint.

      Returns
      -------
      converted : `Uint`
          The unsigned integer obtained from the given hexadecimal string.
      *)
  (* TODO statement *)
  M.pure tt.

Definition hex_to_u64 (hex_string : str) : M U64 :=
  (*
      Convert hex string to U64.

      Parameters
      ----------
      hex_string :
          The hexadecimal string to be converted to U256.

      Returns
      -------
      converted : `U64`
          The U64 integer obtained from the given hexadecimal string.
      *)
  (* TODO statement *)
  M.pure tt.

Definition hex_to_u256 (hex_string : str) : M U256 :=
  (*
      Convert hex string to U256.

      Parameters
      ----------
      hex_string :
          The hexadecimal string to be converted to U256.

      Returns
      -------
      converted : `U256`
          The U256 integer obtained from the given hexadecimal string.
      *)
  (* TODO statement *)
  M.pure tt.
