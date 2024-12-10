(*
Defines the functions required for creating EVM traces during execution.

A _trace_ is a log of operations that took place during an event or period of
time. In the case of an EVM trace, the log is built from a series of
[`TraceEvent`]s emitted during the execution of a transaction.

Note that this module _does not_ contain a trace implementation. Instead, it
defines only the events that can be collected into a trace by some other
package. See [`EvmTracer`].

See [EIP-3155] for more details on EVM traces.

[`EvmTracer`]: ref:ethereum.trace.EvmTracer
[`TraceEvent`]: ref:ethereum.trace.TraceEvent
[EIP-3155]: https://eips.ethereum.org/EIPS/eip-3155
*)


Definition discard_evm_trace : M unit :=
  (*
      An [`EvmTracer`] that discards all events.

      [`EvmTracer`]: ref:ethereum.trace.EvmTracer
      *)

