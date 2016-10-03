# Party

Experimenting with [GenStage](https://hexdocs.pm/gen_stage/Experimental.GenStage.html) [PartitionDispatcher](https://github.com/elixir-lang/gen_stage/blob/16337b94d16a21781658c562ac96221886e50194/lib/gen_stage/partition_dispatcher.ex).

### Producer

The Producer generates and returns demand-length lists of randomly generated words. It specifies the [PartitionDispatcher](https://github.com/elixir-lang/gen_stage/blob/16337b94d16a21781658c562ac96221886e50194/lib/gen_stage/partition_dispatcher.ex) with four available partitions and a hash function that dispatches to Consumer partition based on the first letter of the generated word.

### Consumers

Four Consumers are started and subscribed to each available partition that simply wait for words and output them.

```
iex> Party.start
:ok
=== partition 1 received words: ["accusamus", "atque", "id", "corporis", "dolor"] ===
=== partition 2 received words: ["nam"] ===
=== partition 3 received words: ["tempora", "veniam", "sunt", "sit", "similique"] ===
=== partition 1 received words: ["dolorem", "dolorem", "id", "eligendi", "eos"] ===
=== partition 2 received words: ["quaerat", "officiis", "quis", "quidem"] ===
=== partition 3 received words: ["voluptate"] ===
=== partition 1 received words: ["dolorum", "fugiat", "est", "assumenda", "fuga"] ===
=== partition 2 received words: ["placeat", "non", "reprehenderit"] ===
=== partition 3 received words: ["veritatis", "temporibus"] ===
=== partition 1 received words: ["et", "dolorem", "ad", "cumque", "hic"] ===
=== partition 2 received words: ["qui", "quos"] ===
=== partition 3 received words: ["vel"] ===
=== partition 1 received words: ["eum", "aspernatur", "et", "ipsum", "explicabo"] ===
=== partition 2 received words: ["necessitatibus", "qui", "ratione", "occaecati", "reprehenderit"] ===
=== partition 3 received words: ["temporibus", "similique", "sint"] ===
=== partition 1 received words: ["dolor", "adipisci", "est", "dolorem", "dolor"] ===
=== partition 2 received words: ["officia", "quia"] ===
=== partition 3 received words: ["ullam"] ===
=== partition 3 received words: ["vel", "voluptate"] ===
=== partition 1 received words: ["dolores", "at", "impedit", "est", "culpa"] ===
=== partition 2 received words: ["nihil", "qui"] ===
=== partition 1 received words: ["aspernatur", "et", "itaque", "dolore", "culpa"] ===
=== partition 2 received words: ["necessitatibus"] ===
=== partition 3 received words: ["velit", "ut", "voluptatem"] ===
=== partition 1 received words: ["inventore", "aut", "aut", "cum", "eum"] ===
=== partition 2 received words: ["quod", "quis", "quidem"] ===
=== partition 3 received words: ["velit"] ===
```
