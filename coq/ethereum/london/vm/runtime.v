(*
Ethereum Virtual Machine (EVM) Runtime Operations
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

Runtime related operations used while executing EVM code.
*)

Require typing.
Require ethereum_types.numeric.
Require london.vm.instructions.

Definition get_valid_jump_destinations : M unit :=
  (*
      Analyze the evm code to obtain the set of valid jump destinations.

      Valid jump destinations are defined as follows:
          * The jump destination is less than the length of the code.
          * The jump destination should have the `JUMPDEST` opcode (0x5B).
          * The jump destination shouldn't be part of the data corresponding to
            `PUSH-N` opcodes.

      Note - Jump destinations are 0-indexed.

      Parameters
      ----------
      code :
          The EVM code which is to be executed.

      Returns
      -------
      valid_jump_destinations: `Set[Uint]`
          The set of valid jump destinations in the code.
      *)
  let* valid_jump_destinations := set (|

  |) in
  let* pc := ethereum_types.numeric.Uint (|
    (* TODO expression *)
  |) in
  (* TODO statement *)
  (* TODO statement *)

