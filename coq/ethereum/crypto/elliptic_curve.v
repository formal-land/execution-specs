(* Generated *)
(*
Elliptic Curves
^^^^^^^^^^^^^^^
*)

Require typing.

Definition secp256k1_recover (r : U256) (s : U256) (v : U256) (msg_hash : Hash32) : M Bytes :=
  (*
      Recovers the public key from a given signature.

      Parameters
      ----------
      r :
          TODO
      s :
          TODO
      v :
          TODO
      msg_hash :
          Hash of the message being recovered.

      Returns
      -------
      public_key : `ethereum.base_types.Bytes`
          Recovered public key.
      *)
  do* M.assign "r_bytes" [[
    M.get_field ~(| r, "to_be_bytes32" |) ~(|

    |) in
  ]] in
  do* M.assign "s_bytes" [[
    M.get_field ~(| s, "to_be_bytes32" |) ~(|

    |) in
  ]] in
  do* M.assign "signature" [[
    M.get_local ~(| "bytearray" |) ~(|
      (* TODO expression *)
    |) in
  ]] in
  (* TODO assignment *)
  (* TODO assignment *)
  (* TODO assignment *)
  do* M.assign "public_key" [[
    M.get_field ~(| M.get_field ~(| M.get_local ~(| "coincurve" |), "PublicKey" |), "from_signature_and_message" |) ~(|
      M.get_local ~(| "bytes" |) ~(|
        M.get_local ~(| "signature" |)
      |),
      msg_hash
    |) in
  ]] in
  do* M.assign "public_key" [[
    (* TODO expression *) in
  ]] in
  (* TODO statement *)
  M.pure tt.
