(* Generated *)
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
Require ethereum.constantinople.vm.instructions.

Definition get_valid_jump_destinations (code : bytes) : M (* TODO type *) :=
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
  do* M.assign "valid_jump_destinations" [[
    M.get_local ~(| "set" |) ~(|

    |) in
  ]] in
  do* M.assign "pc" [[
    ethereum_types.numeric.Uint ~(|
      0
    |) in
  ]] in
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.
