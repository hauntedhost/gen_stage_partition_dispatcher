defmodule Party.Consumer do
  alias Experimental.GenStage
  use GenStage

  def start_link(partition) do
    initial_state = %{partition: partition}
    GenStage.start_link(__MODULE__, initial_state)
  end

  def init(initial_state) do
    {:consumer, initial_state}
  end

  def handle_events(words, _from_producer, state = %{partition: partition}) do
    IO.puts "=== partition #{partition} received words: #{inspect(words)} ==="
    {:noreply, [], state}
  end
end
