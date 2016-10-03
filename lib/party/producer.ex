defmodule Party.Producer do
  alias Experimental.GenStage
  alias GenStage.PartitionDispatcher
  use GenStage

  def start_link do
    GenStage.start_link(__MODULE__, nil)
  end

  def init(initial_state) do
    dispatcher_options = [
      partitions: partitions_list,
      hash: &partition_by_first_letter/1
    ]
    {:producer, initial_state, dispatcher: {PartitionDispatcher, dispatcher_options}}
  end

  def handle_demand(demand, state) when demand > 0 do
    words = Enum.map(1..demand, fn(_) -> Faker.Lorem.word end)
    {:noreply, words, state}
  end

  def partitions_list do
    ~w(a_i j_r s_z other)a
  end

  def partition_by_first_letter(event) do
    partition = case first_char_downcase(event) do
      c when c in ~w(a b c d e f g h i) -> :a_i
      c when c in ~w(j k l m n o p q r) -> :j_r
      c when c in ~w(s t u v w x y z)   -> :s_z
      _                                 -> :other
    end
    {event, partition}
  end

  defp first_char_downcase(string) do
    string
    |> String.at(0)
    |> String.downcase
  end
end
