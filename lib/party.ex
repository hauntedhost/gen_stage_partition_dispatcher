defmodule Party do
  alias Experimental.GenStage
  alias Party.{Consumer, Producer}
  use GenStage

  def start do
    {:ok, producer} = Producer.start_link
    Producer.partitions_list
    |> Enum.each(fn(partition) ->
      {:ok, consumer} = Consumer.start_link(partition)
      GenStage.sync_subscribe(consumer,
        to: producer,
        partition: partition,
        min_demand: 5,
        max_demand: 10
      )
    end)
  end
end
