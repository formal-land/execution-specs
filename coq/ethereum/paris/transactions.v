(*
Transactions are atomic units of work created externally to Ethereum and
submitted to be executed. If Ethereum is viewed as a state machine,
transactions are the events that move between states.
*)

Require dataclasses.
Require typing.
Require ethereum_types.bytes.
Require ethereum_types.frozen.
Require ethereum_types.numeric.
Require paris.exceptions.
Require paris.fork_types.

Definition encode_transaction : M unit :=
  (*
      Encode a transaction. Needed because non-legacy transactions aren't RLP.
      *)
  (* TODO statement *)


Definition decode_transaction : M unit :=
  (*
      Decode a transaction. Needed because non-legacy transactions aren't RLP.
      *)
  (* TODO statement *)

