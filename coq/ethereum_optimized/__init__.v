(* Generated *)
(*
Optimized Implementations
^^^^^^^^^^^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

This module contains alternative implementations of routines in the spec that
have been optimized for speed rather than clarity.

They can be monkey patched in during start up by calling the `monkey_patch()`
function. This must be done before those modules are imported anywhere.
*)

Require importlib.
Require typing.
Require ethereum_spec_tools.forks.
Require ethereum_optimized.fork.
Require ethereum_optimized.state_db.

Definition monkey_patch_optimized_state_db (fork_name : str) (state_path : (* TODO type *)) : M unit :=
  (*
      Replace the state interface with one that supports high performance
      updates and storing state in a database.

      This function must be called before the state interface is imported
      anywhere.
      *)
  do* M.assign "slow_state" [[
    typing.cast ~(|
      typing.Any,
      importlib.import_module ~(|
        (* TODO expression *)
      |)
    |) in
  ]] in
  do* M.assign "optimized_state_db_patches" [[
    state_db.get_optimized_state_patches ~(|
      fork_name
    |) in
  ]] in
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.

Definition monkey_patch_optimized_spec (fork_name : str) : M unit :=
  (*
      Replace the ethash implementation with one that supports higher
      performance.

      This function must be called before the spec interface is imported
      anywhere.
      *)
  do* M.assign "slow_spec" [[
    importlib.import_module ~(|
      (* TODO expression *)
    |) in
  ]] in
  do* M.assign "optimized_pow_patches" [[
    fork.get_optimized_pow_patches ~(|
      fork_name
    |) in
  ]] in
  (* TODO statement *)
  M.pure tt.

Definition monkey_patch (state_path : (* TODO type *)) : M unit :=
  (*
      Apply all monkey patches to the specification.
      *)
  do* M.assign "forks" [[
    M.get_field ~(| ethereum_spec_tools.forks.Hardfork, "discover" |) ~(|

    |) in
  ]] in
  (* TODO statement *)
  M.pure tt.
