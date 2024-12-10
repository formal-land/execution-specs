(*
Elliptic Curves
^^^^^^^^^^^^^^^
*)

Require typing.

Definition secp256k1_recover : M unit :=
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
  let* r_bytes := r.["to_be_bytes32"] (|

  |) in
  let* s_bytes := s.["to_be_bytes32"] (|

  |) in
  let* signature := bytearray (|
    (* TODO expression *)
  |) in
  (* TODO assignment *)
  (* TODO assignment *)
  (* TODO assignment *)
  let* public_key := coincurve.["PublicKey"].["from_signature_and_message"] (|
    bytes (|
      signature
    |),
    msg_hash
  |) in
  let* public_key := (* TODO expression *) in
  (* TODO statement *)

