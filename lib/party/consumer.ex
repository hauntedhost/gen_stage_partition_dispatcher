defmodule Party.Consumer do
  alias Experimental.GenStage
  use GenStage

  def start_link do
    GenStage.start_link(__MODULE__, nil)
  end

  def init(initial_state) do
    {:consumer, initial_state}
  end

  def handle_events(words, _from_producer, state) do
    IO.puts("=== received words ===")
    IO.inspect(words)

    {:noreply, [], state}
  end

  def handle_info(message, state) do
    IO.puts "=== received message ==="
    IO.inspect(message)

    {:noreply, [], state}
  end
end
