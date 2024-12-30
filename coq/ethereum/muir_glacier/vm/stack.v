(* Generated *)
(*
Ethereum Virtual Machine (EVM) Stack
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Implementation of the stack operators for the EVM.
*)

Require typing.
Require ethereum_types.numeric.
Require ethereum.muir_glacier.vm.exceptions.

Definition pop (stack : (* TODO type *)) : M U256 :=
  (*
      Pops the top item off of `stack`.

      Parameters
      ----------
      stack :
          EVM stack.

      Returns
      -------
      value : `U256`
          The top element on the stack.

      *)
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.

Definition push (stack : (* TODO type *)) (value : U256) : M unit :=
  (*
      Pushes `value` onto `stack`.

      Parameters
      ----------
      stack :
          EVM stack.

      value :
          Item to be pushed onto `stack`.

      *)
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.
