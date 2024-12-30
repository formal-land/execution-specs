(* Generated *)
(*
The Blake2 Implementation
^^^^^^^^^^^^^^^^^^^^^^^^^^
*)


Definition spit_le_to_uint (data : bytes) (start : int) (num_words : int) : M (* TODO type *) :=
  (*
      Extracts 8 byte words from a given data.

      Parameters
      ----------
      data :
          The data in bytes from which the words need to be extracted
      start :
          Position to start the extraction
      num_words:
          The number of words to be extracted
      *)
  do* M.assign "words" [[
    (* TODO expression *) in
  ]] in
  (* TODO statement *)
  (* TODO statement *)
  M.pure tt.
