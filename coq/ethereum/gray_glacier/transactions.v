(* Generated *)
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
Require ethereum.__init__.
Require ethereum.gray_glacier.exceptions.
Require ethereum.gray_glacier.fork_types.

Definition encode_transaction (tx : Transaction) : M (* TODO type *) :=
  (*
      Encode a transaction. Needed because non-legacy transactions aren't RLP.
      *)
  (* TODO statement *)
  M.pure tt.

Definition decode_transaction (tx : (* TODO type *)) : M Transaction :=
  (*
      Decode a transaction. Needed because non-legacy transactions aren't RLP.
      *)
  (* TODO statement *)
  M.pure tt.
