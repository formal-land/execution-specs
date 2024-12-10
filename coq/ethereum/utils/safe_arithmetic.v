(*
Safe Arithmetic for U256 Integer Type
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Safe arithmetic utility functions for U256 integer type.
*)

Require typing.
Require ethereum_types.numeric.

Definition u256_safe_add : M unit :=
  (*
      Adds together the given sequence of numbers. If the total sum of the
      numbers exceeds `U256.MAX_VALUE` then an exception is raised.
      If `exception_type` = None then the exception raised defaults to the one
      raised by `U256` when `U256.value > U256.MAX_VALUE`
      else `exception_type` is raised.

      Parameters
      ----------
      numbers :
          The sequence of numbers that need to be added together.

      exception_type:
          The exception that needs to be raised if the sum of the `numbers`
          exceeds `U256.MAX_VALUE`.

      Returns
      -------
      result : `ethereum.base_types.U256`
          The sum of the given sequence of numbers if the total is less than
          `U256.MAX_VALUE` else an exception is raised.
          If `exception_type` = None then the exception raised defaults to the
          one raised by `U256` when `U256.value > U256.MAX_VALUE`
          else `exception_type` is raised.
      *)
  (* TODO statement *)


Definition u256_safe_multiply : M unit :=
  (*
      Multiplies together the given sequence of numbers. If the net product of
      the numbers exceeds `U256.MAX_VALUE` then an exception is raised.
      If `exception_type` = None then the exception raised defaults to the one
      raised by `U256` when `U256.value > U256.MAX_VALUE` else
      `exception_type` is raised.

      Parameters
      ----------
      numbers :
          The sequence of numbers that need to be multiplies together.

      exception_type:
          The exception that needs to be raised if the sum of the `numbers`
          exceeds `U256.MAX_VALUE`.

      Returns
      -------
      result : `ethereum.base_types.U256`
          The multiplication product of the given sequence of numbers if the
          net product  is less than `U256.MAX_VALUE` else an exception is raised.
          If `exception_type` = None then the exception raised defaults to the
          one raised by `U256` when `U256.value > U256.MAX_VALUE`
          else `exception_type` is raised.
      *)
  let* result := ethereum_types.numeric.Uint (|
    (* TODO expression *)
  |) in
  (* TODO statement *)

