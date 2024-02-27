defmodule IcyOban.UpdateField do
  use Oban.Pro.Workers.Chain, queue: :default, by: [:worker, args: :mg_id]

  require Logger

  args_schema do
    field(:id, :id, required: true)
    field(:mg_id, :id, required: true)
  end

  @impl true
  def process(%Job{id: id}) do
    :timer.sleep(:timer.seconds(4))
    Logger.info("Processed job #{id}")

    :ok
  end

  # IcyOban.UpdateField.replicate()
  def replicate do
    200
    |> Stream.unfold(fn
      0 -> nil
      n -> {%{mg_id: 1, id: n}, n - 1}
    end)
    |> Stream.map(&IcyOban.UpdateField.new/1)
    |> Enum.each(&Oban.insert/1)
  end
end
