(*
The KZG Implementation
^^^^^^^^^^^^^^^^^^^^^^
*)

Require hashlib.
Require typing.
Require eth_typing.bls.
Require ethereum_types.bytes.
Require ethereum_types.numeric.
Require py_ecc.bls.
Require py_ecc.bls.g2_primitives.
Require py_ecc.fields.
Require py_ecc.fields.
Require py_ecc.optimized_bls12_381.
Require py_ecc.optimized_bls12_381.optimized_curve.
Require py_ecc.optimized_bls12_381.optimized_pairing.
Require ethereum.utils.hexadecimal.

Definition kzg_commitment_to_versioned_hash : M unit :=
  (*
      Convert a KZG commitment to a versioned hash.
      *)
  (* TODO statement *)


Definition validate_kzg_g1 : M unit :=
  (*
      Perform BLS validation required by the types `KZGProof`
      and `KZGCommitment`.
      *)
  (* TODO statement *)
  (* TODO statement *)


Definition bytes_to_kzg_commitment : M unit :=
  (*
      Convert untrusted bytes into a trusted and validated KZGCommitment.
      *)
  do* validate_kzg_g1 (|
    b
  |) in
  (* TODO statement *)


Definition bytes_to_bls_field : M unit :=
  (*
      Convert untrusted bytes to a trusted and validated BLS scalar
      field element. This function does not accept inputs greater than
      the BLS modulus.
      *)
  let* field_element := int.["from_bytes"] (|
    b,
    (* TODO expression *)
  |) in
  (* TODO statement *)
  (* TODO statement *)


Definition bytes_to_kzg_proof : M unit :=
  (*
      Convert untrusted bytes into a trusted and validated KZGProof.
      *)
  do* validate_kzg_g1 (|
    b
  |) in
  (* TODO statement *)


Definition pairing_check : M unit :=
  (*
      Check if the pairings are valid.
      *)
  (* TODO assignment *)
  let* final_exponentiation := py_ecc.optimized_bls12_381.optimized_pairing.final_exponentiate (|
    (* TODO expression *)
  |) in
  (* TODO statement *)


Definition verify_kzg_proof : M unit :=
  (*
      Verify KZG proof that ``p(z) == y`` where ``p(z)``
      is the polynomial represented by ``polynomial_kzg``.
      Receives inputs as bytes.
      Public method.
      *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)
  (* TODO statement *)


Definition verify_kzg_proof_impl : M unit :=
  (*
      Verify KZG proof that ``p(z) == y`` where ``p(z)``
      is the polynomial represented by ``polynomial_kzg``.
      *)
  let* X_minus_z := py_ecc.optimized_bls12_381.add (|
    py_ecc.bls.g2_primitives.signature_to_G2 (|
      eth_typing.bls.BLSSignature (|
        ethereum.utils.hexadecimal.hex_to_bytes (|
          KZG_SETUP_G2_MONOMIAL_1
        |)
      |)
    |),
    py_ecc.optimized_bls12_381.multiply (|
      py_ecc.optimized_bls12_381.optimized_curve.G2,
      int (|
        (* TODO expression *)
      |)
    |)
  |) in
  let* P_minus_y := py_ecc.optimized_bls12_381.add (|
    py_ecc.bls.g2_primitives.pubkey_to_G1 (|
      eth_typing.bls.BLSPubkey (|
        commitment
      |)
    |),
    py_ecc.optimized_bls12_381.multiply (|
      py_ecc.optimized_bls12_381.optimized_curve.G1,
      int (|
        (* TODO expression *)
      |)
    |)
  |) in
  (* TODO statement *)

