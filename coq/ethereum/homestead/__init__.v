(*
The Homestead fork increases the gas cost of creating contracts, restricts the
range of valid ECDSA signatures for transactions (but not precompiles), tweaks
the behavior of contract creation with insufficient gas, delays the
difficulty bomb, and adds an improved delegate call EVM instruction.
*)

Require ethereum.fork_criteria.
