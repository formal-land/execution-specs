(* Generated *)
(*
Optimized State
^^^^^^^^^^^^^^^

.. contents:: Table of Contents
    :backlinks: none
    :local:

Introduction
------------

This module contains functions can be monkey patched into the fork's `state`
module to use an optimized database backed state.
*)


Definition get_optimized_state_patches (fork : str) : M (* TODO type *) :=
  (*
      Get a dictionary of functions/objects to be monkey patched into the state
      to make it optimized.
      *)
  (* TODO statement *)
  do* M.assign "types_mod" [[
    M.get_local ~(| "cast" |) ~(|
      M.get_local ~(| "Any" |),
      M.get_local ~(| "import_module" |) ~(|
        (* TODO expression *)
      |)
    |) in
  ]] in
  do* M.assign "state_mod" [[
    M.get_local ~(| "cast" |) ~(|
      M.get_local ~(| "Any" |),
      M.get_local ~(| "import_module" |) ~(|
        (* TODO expression *)
      |)
    |) in
  ]] in
  do* M.assign "Account" [[
    M.get_field ~(| M.get_local ~(| "types_mod" |), "Account" |) in
  ]] in
  do* M.assign "has_transient_storage" [[
    M.get_local ~(| "hasattr" |) ~(|
      M.get_local ~(| "state_mod" |),
      (* TODO constant *)
    |) in
  ]] in
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.
