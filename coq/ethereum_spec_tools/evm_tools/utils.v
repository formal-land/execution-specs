(* Generated *)
(*
Utilities for the EVM tools
*)


Definition parse_hex_or_int (value : str) (to_type : (* TODO type *)) : M W :=
  (*Read a Uint type from a hex string or int*)
  (* TODO statement *)
  M.pure tt.

Definition ensure_success (f : Callable) : M Any :=
  (*
      Ensure that the function call succeeds.
      Raise a FatalException if it fails.
      *)
  (* TODO statement *)
  M.pure tt.

Definition get_module_name (forks : Any) (options : Any) (stdin : Any) : M (* TODO type *) :=
  (*
      Get the module name and the fork block for the given state fork.
      *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  do* [[ M.get_field ~(| M.get_local ~(| "sys" |), "exit" |) ~(|
    (* TODO expression *)
  |) ]] in
  M.pure tt.

Definition get_supported_forks : M (* TODO type *) :=
  (*
      Get the supported forks.
      *)
  do* M.assign "supported_forks" [[
    (* TODO expression *) in
  ]] in
  do* [[ M.get_field ~(| M.get_local ~(| "supported_forks" |), "extend" |) ~(|
    M.get_field ~(| M.get_local ~(| "EXCEPTION_MAPS" |), "keys" |) ~(|

    |)
  |) ]] in
  do* M.assign "supported_forks" [[
    (* TODO expression *) in
  ]] in
  (* TODO statement *)
  M.pure tt.

Definition get_stream_logger (name : str) : M Any :=
  (*
      Get a logger that writes to stdout.
      *)
  do* M.assign "logger" [[
    M.get_field ~(| M.get_local ~(| "logging" |), "getLogger" |) ~(|
      name
    |) in
  ]] in
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.

Definition secp256k1_sign (msg_hash : Hash32) (secret_key : int) : M (* TODO type *) :=
  (*
      Returns the signature of a message hash given the secret key.
      *)
  do* M.assign "private_key" [[
    M.get_field ~(| M.get_field ~(| M.get_local ~(| "coincurve" |), "PrivateKey" |), "from_int" |) ~(|
      secret_key
    |) in
  ]] in
  do* M.assign "signature" [[
    M.get_field ~(| M.get_local ~(| "private_key" |), "sign_recoverable" |) ~(|
      msg_hash
    |) in
  ]] in
  (* TODO statement *)
  M.pure tt.
