(*
Activation criteria for forks.

Most generally, a _fork_ is a divergence in a blockchain resulting in multiple
tips. Most forks are short lived, and can be caused by networking issues or the
behavior of block creators. These short-lived forks resolve themselves
according to the rules of the protocol, eventually settling back to a single
tip of the chain.

A second class of forks are intentionally created by changing the rules of the
protocol, and never resolve back to a single tip. Older software will continue
to follow the original fork, while updated software will create and follow a
new fork.

For these intentional forks to succeed, all participants need to agree on
exactly when to switch rules. The agreed upon criteria are represented by
subclasses of [`ForkCriteria`], like [`ByBlockNumber`] and [`ByTimestamp`]. The
special type of [`Unscheduled`] is used for forks in active development that do
not yet have a scheduled deployment.

[`ForkCriteria`]: ref:ethereum.fork_criteria.ForkCriteria
[`ByBlockNumber`]: ref:ethereum.fork_criteria.ByBlockNumber
[`ByTimestamp`]: ref:ethereum.fork_criteria.ByTimestamp
[`Unscheduled`]: ref:ethereum.fork_criteria.Unscheduled
*)

