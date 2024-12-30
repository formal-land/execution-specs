(* Generated *)
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

Definition kzg_commitment_to_versioned_hash (kzg_commitment : KZGCommitment) : M VersionedHash :=
  (*
      Convert a KZG commitment to a versioned hash.
      *)
  (* TODO statement *)
  M.pure tt.

Definition validate_kzg_g1 (b : Bytes48) : M unit :=
  (*
      Perform BLS validation required by the types `KZGProof`
      and `KZGCommitment`.
      *)
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.

Definition bytes_to_kzg_commitment (b : Bytes48) : M KZGCommitment :=
  (*
      Convert untrusted bytes into a trusted and validated KZGCommitment.
      *)
  do* [[ M.get_local ~(| "validate_kzg_g1" |) ~(|
    b
  |) ]] in
  (* TODO statement *)
  M.pure tt.

Definition bytes_to_bls_field (b : Bytes32) : M BLSFieldElement :=
  (*
      Convert untrusted bytes to a trusted and validated BLS scalar
      field element. This function does not accept inputs greater than
      the BLS modulus.
      *)
  do* M.assign "field_element" [[
    M.get_field ~(| M.get_local ~(| "int" |), "from_bytes" |) ~(|
      b,
      (* TODO constant *)
    |) in
  ]] in
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.

Definition bytes_to_kzg_proof (b : Bytes48) : M KZGProof :=
  (*
      Convert untrusted bytes into a trusted and validated KZGProof.
      *)
  do* [[ M.get_local ~(| "validate_kzg_g1" |) ~(|
    b
  |) ]] in
  (* TODO statement *)
  M.pure tt.

Definition pairing_check (values : (* TODO type *)) : M bool :=
  (*
      Check if the pairings are valid.
      *)
  (* TODO assignment *)
  do* M.assign "final_exponentiation" [[
    py_ecc.optimized_bls12_381.optimized_pairing.final_exponentiate ~(|
      (* TODO expression *)
    |) in
  ]] in
  (* TODO statement *)
  M.pure tt.

Definition verify_kzg_proof (commitment_bytes : Bytes48) (z_bytes : Bytes32) (y_bytes : Bytes32) (proof_bytes : Bytes48) : M bool :=
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
  M.pure tt.

Definition verify_kzg_proof_impl (commitment : KZGCommitment) (z : BLSFieldElement) (y : BLSFieldElement) (proof : KZGProof) : M bool :=
  (*
      Verify KZG proof that ``p(z) == y`` where ``p(z)``
      is the polynomial represented by ``polynomial_kzg``.
      *)
  do* M.assign "X_minus_z" [[
    py_ecc.optimized_bls12_381.add ~(|
      py_ecc.bls.g2_primitives.signature_to_G2 ~(|
        eth_typing.bls.BLSSignature ~(|
          ethereum.utils.hexadecimal.hex_to_bytes ~(|
            M.get_local ~(| "KZG_SETUP_G2_MONOMIAL_1" |)
          |)
        |)
      |),
      py_ecc.optimized_bls12_381.multiply ~(|
        py_ecc.optimized_bls12_381.optimized_curve.G2,
        M.get_local ~(| "int" |) ~(|
          (* TODO expression *)
        |)
      |)
    |) in
  ]] in
  do* M.assign "P_minus_y" [[
    py_ecc.optimized_bls12_381.add ~(|
      py_ecc.bls.g2_primitives.pubkey_to_G1 ~(|
        eth_typing.bls.BLSPubkey ~(|
          commitment
        |)
      |),
      py_ecc.optimized_bls12_381.multiply ~(|
        py_ecc.optimized_bls12_381.optimized_curve.G1,
        M.get_local ~(| "int" |) ~(|
          (* TODO expression *)
        |)
      |)
    |) in
  ]] in
  (* TODO statement *)
  M.pure tt.
