(*
The Cancun fork introduces transient storage, exposes beacon chain roots,
introduces a new blob-carrying transaction type, adds a memory copying
instruction, limits self-destruct to only work for contracts created in the
same transaction, and adds an instruction to read the blob base fee.
*)

Require ethereum.fork_criteria.
