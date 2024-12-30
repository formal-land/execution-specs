(* Generated *)
(*
Ethereum Virtual Machine (EVM) Memory
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

EVM memory operations.
*)

Require ethereum_types.bytes.
Require ethereum_types.numeric.
Require ethereum.utils.byte.

Definition memory_write (memory : bytearray) (start_position : U256) (value : Bytes) : M unit :=
  (*
      Writes to memory.

      Parameters
      ----------
      memory :
          Memory contents of the EVM.
      start_position :
          Starting pointer to the memory.
      value :
          Data to write to memory.
      *)
  (* TODO assignment *)
  M.pure tt.

Definition memory_read_bytes (memory : bytearray) (start_position : U256) (size : U256) : M bytearray :=
  (*
      Read bytes from memory.

      Parameters
      ----------
      memory :
          Memory contents of the EVM.
      start_position :
          Starting pointer to the memory.
      size :
          Size of the data that needs to be read from `start_position`.

      Returns
      -------
      data_bytes :
          Data read from memory.
      *)
  (* TODO statement *)
  M.pure tt.

Definition buffer_read (buffer : Bytes) (start_position : U256) (size : U256) : M Bytes :=
  (*
      Read bytes from a buffer. Padding with zeros if necessary.

      Parameters
      ----------
      buffer :
          Memory contents of the EVM.
      start_position :
          Starting pointer to the memory.
      size :
          Size of the data that needs to be read from `start_position`.

      Returns
      -------
      data_bytes :
          Data read from memory.
      *)
  (* TODO statement *)
  M.pure tt.
