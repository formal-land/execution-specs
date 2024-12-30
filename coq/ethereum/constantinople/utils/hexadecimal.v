(* Generated *)
(*
Utility Functions For Hexadecimal Strings
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Hexadecimal utility functions used in this specification, specific to
Constantinople types.
*)

Require ethereum.utils.hexadecimal.
Require ethereum.constantinople.fork_types.

Definition hex_to_root (hex_string : str) : M Root :=
  (*
      Convert hex string to trie root.

      Parameters
      ----------
      hex_string :
          The hexadecimal string to be converted to trie root.

      Returns
      -------
      root : `Root`
          Trie root obtained from the given hexadecimal string.
      *)
  (* TODO statement *)
  M.pure tt.

Definition hex_to_bloom (hex_string : str) : M Bloom :=
  (*
      Convert hex string to bloom.

      Parameters
      ----------
      hex_string :
          The hexadecimal string to be converted to bloom.

      Returns
      -------
      bloom : `Bloom`
          Bloom obtained from the given hexadecimal string.
      *)
  (* TODO statement *)
  M.pure tt.

Definition hex_to_address (hex_string : str) : M Address :=
  (*
      Convert hex string to Address (20 bytes).

      Parameters
      ----------
      hex_string :
          The hexadecimal string to be converted to Address.

      Returns
      -------
      address : `Address`
          The address obtained from the given hexadecimal string.
      *)
  (* TODO statement *)
  M.pure tt.
