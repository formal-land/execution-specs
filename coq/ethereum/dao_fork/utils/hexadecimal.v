(*
Utility Functions For Hexadecimal Strings
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Hexadecimal utility functions used in this specification, specific to Dao Fork
types.
*)

Require ethereum.utils.hexadecimal.
Require dao_fork.fork_types.

Definition hex_to_root : M unit :=
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


Definition hex_to_bloom : M unit :=
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


Definition hex_to_address : M unit :=
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

