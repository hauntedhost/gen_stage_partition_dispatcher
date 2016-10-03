defmodule Party do
  alias Experimental.GenStage
  alias Party.{Consumer, Producer}
  use GenStage

  def start do
    {:ok, producer} = Producer.start_link

    Producer.partitions_list
    |> Enum.each(fn(partition) ->
      IO.puts "=== starting consumer for partition: #{inspect(partition)} ==="

      {:ok, consumer} = Consumer.start_link
      GenStage.sync_subscribe(consumer,
        to: producer,
        partition: partition,
        min_demand: 2,
        max_demand: 5
      )
    end)
  end
end
