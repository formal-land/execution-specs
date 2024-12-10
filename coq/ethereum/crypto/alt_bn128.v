(*
The alt_bn128 curve
^^^^^^^^^^^^^^^^^^^
*)


Definition bnf2_to_bnf12 : M unit :=
  (*
      Lift a field element in `BNF2` to `BNF12`.
      *)
  (* TODO statement *)


Definition bnp_to_bnp12 : M unit :=
  (*
      Lift a point from `BNP` to `BNP12`.
      *)
  (* TODO statement *)


Definition twist : M unit :=
  (*
      Apply to twist to change variables from the curve `BNP2` to `BNP12`.
      *)
  (* TODO statement *)


Definition linefunc : M unit :=
  (*
      Evaluate the function defining the line between points `p1` and `p2` at the
      point `t`. The mathematical significance of this function is that is has
      divisor `(p1) + (p2) + (p1 + p2) - 3(O)`.

      Note: Abstract mathematical presentations of Miller's algorithm often
      specify the divisor `(p1) + (p2) - (p1 + p2) - (O)`. This turns out not to
      matter.
      *)
  (* TODO statement *)


Definition miller_loop : M unit :=
  (*
      The core of the pairing algorithm.
      *)
  (* TODO statement *)
  let* r := q in
  let* f := BNF12.["from_int"] (|
    (* TODO expression *)
  |) in
  (* TODO statement *)
  (* TODO statement *)
  let* q1 := BNP12 (|
    q.["x"].["frobenius"] (|

    |),
    q.["y"].["frobenius"] (|

    |)
  |) in
  let* nq2 := BNP12 (|
    q1.["x"].["frobenius"] (|

    |),
    (* TODO expression *)
  |) in
  let* f := (* TODO expression *) in
  let* r := (* TODO expression *) in
  let* f := (* TODO expression *) in
  (* TODO statement *)


Definition pairing : M unit :=
  (*
      Compute the pairing of `q` and `p`.
      *)
  (* TODO statement *)

