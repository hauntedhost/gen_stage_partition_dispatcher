# Party

Experimenting with [GenStage](https://hexdocs.pm/gen_stage/Experimental.GenStage.html) [PartitionDispatcher](https://github.com/elixir-lang/gen_stage/blob/16337b94d16a21781658c562ac96221886e50194/lib/gen_stage/partition_dispatcher.ex).

### Producer

The Producer generates and returns demand-length lists of randomly generated words. It specifies the [PartitionDispatcher](https://github.com/elixir-lang/gen_stage/blob/16337b94d16a21781658c562ac96221886e50194/lib/gen_stage/partition_dispatcher.ex) with four available partitions and a hash function that dispatches to Consumer partition based on the first letter of the generated word.

### Consumers

Four Consumers are started and subscribed to each available partition that simply wait for words and output them.

The problem is, Consumers never receive any events. 😞

```
iex(1)> Party.start
=== starting consumer for partition: "one" ===
=== starting consumer for partition: "two" ===
=== starting consumer for partition: "three" ===
=== starting consumer for partition: "four" ===
:ok
=== handle_demand ===
{:noreply, ["qui", "reiciendis", "id", "sed", "sint"], nil}
=== partition_by_first_letter ===
{"qui", "two"}
=== partition_by_first_letter ===
{"reiciendis", "two"}
=== partition_by_first_letter ===
{"id", "one"}
=== partition_by_first_letter ===
{"sed", "three"}
=== partition_by_first_letter ===
{"sint", "three"}
=== handle_demand ===
{:noreply, ["ut", "sit", "voluptatibus", "voluptas", "soluta"], nil}
=== partition_by_first_letter ===
{"ut", "three"}
=== partition_by_first_letter ===
{"sit", "three"}
=== partition_by_first_letter ===
{"voluptatibus", "three"}
=== partition_by_first_letter ===
{"voluptas", "three"}
=== partition_by_first_letter ===
{"soluta", "three"}
=== handle_demand ===
{:noreply, ["sit", "quae", "quia", "non", "libero"], nil}
=== partition_by_first_letter ===
{"sit", "three"}
=== partition_by_first_letter ===
{"quae", "two"}
=== partition_by_first_letter ===
{"quia", "two"}
=== partition_by_first_letter ===
{"non", "two"}
=== partition_by_first_letter ===
{"libero", "two"}
=== handle_demand ===
{:noreply, ["reiciendis", "quisquam", "velit", "dolor", "ea"], nil}
=== partition_by_first_letter ===
{"reiciendis", "two"}
=== partition_by_first_letter ===
{"quisquam", "two"}
=== partition_by_first_letter ===
{"velit", "three"}
=== partition_by_first_letter ===
{"dolor", "one"}
=== partition_by_first_letter ===
{"ea", "one"}
```
