# Party

Experimenting with [GenStage](https://hexdocs.pm/gen_stage/Experimental.GenStage.html) [PartitionDispatcher](https://github.com/elixir-lang/gen_stage/blob/16337b94d16a21781658c562ac96221886e50194/lib/gen_stage/partition_dispatcher.ex).

### Producer

The Producer generates and returns demand-length lists of randomly generated words. It specifies the [PartitionDispatcher](https://github.com/elixir-lang/gen_stage/blob/16337b94d16a21781658c562ac96221886e50194/lib/gen_stage/partition_dispatcher.ex) with four available partitions and a hash function that dispatches to Consumer partition based on the first letter of the generated word.

### Consumers

Four Consumers are started and subscribed to each available partition that simply wait for words and output them.

```
iex> Party.start
:ok
=== partition a_i received words: ["fuga", "exercitationem", "eligendi", "eum", "enim"] ===
=== partition s_z received words: ["sunt", "ut", "ullam", "voluptatum"] ===
=== partition j_r received words: ["molestiae"] ===
=== partition a_i received words: ["autem", "cum", "est"] ===
=== partition j_r received words: ["non", "quis", "maiores", "perspiciatis", "qui"] ===
=== partition s_z received words: ["sequi", "ut", "veritatis", "tenetur"] ===
=== partition a_i received words: ["blanditiis"] ===
=== partition j_r received words: ["quas"] ===
=== partition s_z received words: ["sed", "temporibus"] ===
=== partition j_r received words: ["magnam", "quia", "quasi"] ===
=== partition a_i received words: ["aspernatur"] ===
=== partition a_i received words: ["iste", "dicta", "et", "et", "et"] ===
=== partition j_r received words: ["necessitatibus", "necessitatibus", "quidem", "ratione", "quod"] ===
=== partition s_z received words: ["voluptatem", "veniam", "voluptas"] ===
=== partition a_i received words: ["autem", "corrupti", "enim", "consequuntur", "ea"] ===
=== partition j_r received words: ["quasi"] ===
=== partition s_z received words: ["voluptatem"] ===
=== partition s_z received words: ["ut"] ===
=== partition a_i received words: ["doloribus", "est", "dolores", "dolorum", "dicta"] ===
=== partition j_r received words: ["quia", "nobis", "perspiciatis", "reiciendis", "repudiandae"] ===
=== partition s_z received words: ["tempora"] ===
=== partition a_i received words: ["id", "aut", "aut", "aut", "aut"] ===
=== partition s_z received words: ["ut"] ===
=== partition j_r received words: ["qui", "non", "quia", "rerum"] ===
=== partition a_i received words: ["deserunt", "et", "facere", "aut", "eaque"] ===
=== partition a_i received words: ["iusto", "aspernatur", "dolores", "incidunt", "harum"] ===
=== partition s_z received words: ["vel", "voluptas"] ===
=== partition j_r received words: ["quibusdam", "quis", "necessitatibus", "quod", "omnis"] ===
=== partition a_i received words: ["et", "et", "explicabo", "est", "ipsum"] ===
=== partition s_z received words: ["tempora"] ===
=== partition j_r received words: ["natus"] ===
=== partition a_i received words: ["consequatur", "corporis"] ===
=== partition s_z received words: ["velit", "sint"] ===
=== partition a_i received words: ["at"] ===
=== partition a_i received words: ["deserunt", "enim"] ===
=== partition j_r received words: ["quis", "mollitia", "mollitia", "praesentium", "nesciunt"] ===
=== partition a_i received words: ["eum", "ex"] ===
=== partition s_z received words: ["sint", "velit", "sed", "sunt"] ===
=== partition j_r received words: ["laborum", "nisi", "non", "quia"] ===
=== partition a_i received words: ["et", "dicta"] ===
=== partition s_z received words: ["saepe", "vitae", "voluptatem"] ===
=== partition s_z received words: ["vero", "vel"] ===
=== partition a_i received words: ["in"] ===
=== partition j_r received words: ["officiis", "rerum", "natus", "quisquam", "perferendis"] ===
=== partition s_z received words: ["tempora", "voluptatem"] ===
=== partition a_i received words: ["et", "dolorem", "facilis"] ===
=== partition s_z received words: ["tempore"] ===
=== partition j_r received words: ["qui"] ===
=== partition a_i received words: ["id", "a"] ===
=== partition j_r received words: ["qui", "quibusdam", "qui", "officiis", "pariatur"] ===
=== partition s_z received words: ["voluptas", "ut"] ===
```
