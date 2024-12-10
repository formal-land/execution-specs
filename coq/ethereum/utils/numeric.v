(*
Utility Functions For Numeric Operations
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Numeric operations specific utility functions used in this specification.
*)

Require typing.
Require ethereum_types.numeric.

Definition get_sign : M unit :=
  (*
      Determines the sign of a number.

      Parameters
      ----------
      value :
          The value whose sign is to be determined.

      Returns
      -------
      sign : `int`
          The sign of the number (-1 or 0 or 1).
          The return value is based on math signum function.
      *)
  (* TODO statement *)


Definition ceil32 : M unit :=
  (*
      Converts a unsigned integer to the next closest multiple of 32.

      Parameters
      ----------
      value :
          The value whose ceil32 is to be calculated.

      Returns
      -------
      ceil32 : `ethereum.base_types.U256`
          The same value if it's a perfect multiple of 32
          else it returns the smallest multiple of 32
          that is greater than `value`.
      *)
  let* ceiling := ethereum_types.numeric.Uint (|
    (* TODO expression *)
  |) in
  let* remainder := (* TODO expression *) in
  (* TODO statement *)


Definition is_prime : M unit :=
  (*
      Checks if `number` is a prime number.

      Parameters
      ----------
      number :
          The number to check for primality.

      Returns
      -------
      is_number_prime : `bool`
          Boolean indicating if `number` is prime or not.
      *)
  let* number := int (|
    number
  |) in
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)


Definition le_bytes_to_uint32_sequence : M unit :=
  (*
      Convert little endian byte stream `data` to a little endian U32
      sequence i.e., the first U32 number of the sequence is the least
      significant U32 number.

      Parameters
      ----------
      data :
          The byte stream (little endian) which is to be converted to a U32
          stream.

      Returns
      -------
      uint32_sequence : `Tuple[U32, ...]`
          Sequence of U32 numbers obtained from the little endian byte
          stream.
      *)
  let* sequence := (* TODO expression *) in
  (* TODO statement *)
  (* TODO statement *)


Definition le_uint32_sequence_to_bytes : M unit :=
  (*
      Obtain little endian byte stream from a little endian U32 sequence
      i.e., the first U32 number of the sequence is the least significant
      U32 number.

      Note - In this conversion, the most significant byte (byte at the end of
      the little endian stream) may have leading zeroes. This function doesn't
      take care of removing these leading zeroes as shown in below example.

      >>> le_uint32_sequence_to_bytes([U32(8)])
      b'\x08\x00\x00\x00'


      Parameters
      ----------
      sequence :
          The U32 stream (little endian) which is to be converted to a
          little endian byte stream.

      Returns
      -------
      result : `bytes`
          The byte stream obtained from the little endian U32 stream.
      *)
  let* result_bytes := (* TODO expression *) in
  (* TODO statement *)
  (* TODO statement *)


Definition le_uint32_sequence_to_uint : M unit :=
  (*
      Obtain Uint from a U32 sequence assuming that this sequence is little
      endian i.e., the first U32 number of the sequence is the least
      significant U32 number.

      Parameters
      ----------
      sequence :
          The U32 stream (little endian) which is to be converted to a Uint.

      Returns
      -------
      value : `Uint`
          The Uint number obtained from the conversion of the little endian
          U32 stream.
      *)
  let* sequence_as_bytes := le_uint32_sequence_to_bytes (|
    sequence
  |) in
  (* TODO statement *)


Definition taylor_exponential : M unit :=
  (*
      Approximates factor * e ** (numerator / denominator) using
      Taylor expansion.

      Parameters
      ----------
      factor :
          The factor.
      numerator :
          The numerator of the exponential.
      denominator :
          The denominator of the exponential.

      Returns
      -------
      output : `ethereum.base_types.Uint`
          The approximation of factor * e ** (numerator / denominator).

      *)
  let* i := ethereum_types.numeric.Uint (|
    (* TODO expression *)
  |) in
  let* output := ethereum_types.numeric.Uint (|
    (* TODO expression *)
  |) in
  let* numerator_accumulated := (* TODO expression *) in
  (* TODO statement *)
  (* TODO statement *)

