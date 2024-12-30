(* Generated *)
(*
The alt_bn128 curve
^^^^^^^^^^^^^^^^^^^
*)

Require ethereum.crypto.__init__.

Definition bnf2_to_bnf12 (x : BNF2) : M BNF12 :=
  (*
      Lift a field element in `BNF2` to `BNF12`.
      *)
  (* TODO statement *)
  M.pure tt.

Definition bnp_to_bnp12 (p : BNP) : M BNP12 :=
  (*
      Lift a point from `BNP` to `BNP12`.
      *)
  (* TODO statement *)
  M.pure tt.

Definition twist (p : BNP2) : M BNP12 :=
  (*
      Apply to twist to change variables from the curve `BNP2` to `BNP12`.
      *)
  (* TODO statement *)
  M.pure tt.

Definition linefunc (p1 : BNP12) (p2 : BNP12) (t : BNP12) : M BNF12 :=
  (*
      Evaluate the function defining the line between points `p1` and `p2` at the
      point `t`. The mathematical significance of this function is that is has
      divisor `(p1) + (p2) + (p1 + p2) - 3(O)`.

      Note: Abstract mathematical presentations of Miller's algorithm often
      specify the divisor `(p1) + (p2) - (p1 + p2) - (O)`. This turns out not to
      matter.
      *)
  (* TODO statement *)
  M.pure tt.

Definition miller_loop (q : BNP12) (p : BNP12) : M BNF12 :=
  (*
      The core of the pairing algorithm.
      *)
  (* TODO statement *)
  do* M.assign "r" [[
    q in
  ]] in
  do* M.assign "f" [[
    M.get_field ~(| M.get_local ~(| "BNF12" |), "from_int" |) ~(|
      1
    |) in
  ]] in
  (* TODO statement *)
  (* TODO statement *)
  do* M.assign "q1" [[
    M.get_local ~(| "BNP12" |) ~(|
      M.get_field ~(| M.get_field ~(| q, "x" |), "frobenius" |) ~(|

      |),
      M.get_field ~(| M.get_field ~(| q, "y" |), "frobenius" |) ~(|

      |)
    |) in
  ]] in
  do* M.assign "nq2" [[
    M.get_local ~(| "BNP12" |) ~(|
      M.get_field ~(| M.get_field ~(| M.get_local ~(| "q1" |), "x" |), "frobenius" |) ~(|

      |),
      (* TODO expression *)
    |) in
  ]] in
  do* M.assign "f" [[
    (* TODO expression *) in
  ]] in
  do* M.assign "r" [[
    (* TODO expression *) in
  ]] in
  do* M.assign "f" [[
    (* TODO expression *) in
  ]] in
  (* TODO statement *)
  M.pure tt.

Definition pairing (q : BNP2) (p : BNP) : M BNF12 :=
  (*
      Compute the pairing of `q` and `p`.
      *)
  (* TODO statement *)
  M.pure tt.
