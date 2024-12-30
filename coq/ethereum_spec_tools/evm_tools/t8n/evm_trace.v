(* Generated *)
(*
The module implements the raw EVM tracer for t8n.
*)


Definition evm_trace (evm : object) (event : TraceEvent) (trace_memory : bool) (trace_stack : bool) (trace_return_data : bool) : M unit :=
  (*
      Create a trace of the event.
      *)
  (* TODO statement *)
  do* M.assign "last_trace" [[
    tt in
  ]] in
  (* TODO statement *)
  do* M.assign "refund_counter" [[
    M.get_field ~(| evm, "refund_counter" |) in
  ]] in
  do* M.assign "parent_evm" [[
    M.get_field ~(| M.get_field ~(| evm, "message" |), "parent_evm" |) in
  ]] in
  (* TODO statement *)
  do* M.assign "len_memory" [[
    M.get_local ~(| "len" |) ~(|
      M.get_field ~(| evm, "memory" |)
    |) in
  ]] in
  do* M.assign "return_data" [[
    tt in
  ]] in
  (* TODO statement *)
  do* M.assign "memory" [[
    tt in
  ]] in
  (* TODO statement *)
  do* M.assign "stack" [[
    tt in
  ]] in
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.

Definition output_op_trace (trace : (* TODO type *)) (json_file : TextIO) : M unit :=
  (*
      Output a single trace to a json file.
      *)
  do* [[ M.get_field ~(| M.get_local ~(| "json" |), "dump" |) ~(|
    trace,
    json_file
  |) ]] in
  do* [[ M.get_field ~(| json_file, "write" |) ~(|
    (* TODO constant *)
  |) ]] in
  M.pure tt.

Definition output_traces (traces : (* TODO type *)) (tx_index : int) (tx_hash : bytes) (output_basedir : (* TODO type *)) : M unit :=
  (*
      Output the traces to a json file.
      *)
  (* TODO statement *)
  M.pure tt.
