(* Generated *)
(*
Dao Fork
^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

The Dao Fork was an irregular state change that moved all Ether from a large
collection of accounts (The Dao and all its children) to a recovery contract.

The recovery contract was previously created using normal contract deployment.
*)

Require ethereum.dao_fork.state.
Require ethereum.dao_fork.utils.hexadecimal.

Definition apply_dao (state : State) : M unit :=
  (*
      Apply the dao fork to the state.

      Parameters
      ----------
      state :
          State before applying the DAO Fork.
      *)
  (* TODO statement *)
  M.pure tt.
