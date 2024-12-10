(*
Hardfork Utility Functions For The Message Data-structure
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Message specific functions used in this tangerine whistle version of
specification.
*)

Require typing.
Require ethereum_types.bytes.
Require ethereum_types.numeric.
Require tangerine_whistle.fork_types.
Require tangerine_whistle.state.
Require tangerine_whistle.vm.
Require tangerine_whistle.utils.address.

Definition prepare_message : M unit :=
  (*
      Execute a transaction against the provided environment.

      Parameters
      ----------
      caller :
          Address which initiated the transaction
      target :
          Address whose code will be executed
      value :
          Value to be transferred.
      data :
          Array of bytes provided to the code in `target`.
      gas :
          Gas provided for the code in `target`.
      env :
          Environment for the Ethereum Virtual Machine.
      code_address :
          This is usually same as the `target` address except when an alternative
          accounts code needs to be executed.
          eg. `CALLCODE` calling a precompile.
      should_transfer_value :
          if True ETH should be transferred while executing a message call.

      Returns
      -------
      message: `ethereum.tangerine_whistle.vm.Message`
          Items containing contract creation or message call specific data.
      *)
  (* TODO statement *)
  (* TODO statement *)

