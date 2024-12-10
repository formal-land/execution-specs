(*
Utility Functions For Byte Strings
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Byte specific utility functions used in this specification.
*)

Require typing.
Require ethereum_types.bytes.
Require ethereum_types.numeric.

Definition left_pad_zero_bytes : M unit :=
  (*
      Left pad zeroes to `value` if its length is less than the given `size`.

      Parameters
      ----------
      value :
          The byte string that needs to be padded.
      size :
          The number of bytes that need that need to be padded.

      Returns
      -------
      left_padded_value: `ethereum.base_types.Bytes`
          left padded byte string of given `size`.
      *)
  (* TODO statement *)


Definition right_pad_zero_bytes : M unit :=
  (*
      Right pad zeroes to `value` if its length is less than the given `size`.

      Parameters
      ----------
      value :
          The byte string that needs to be padded.
      size :
          The number of bytes that need that need to be padded.

      Returns
      -------
      right_padded_value: `ethereum.base_types.Bytes`
          right padded byte string of given `size`.
      *)
  (* TODO statement *)

