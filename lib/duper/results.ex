defmodule Duper.Results do
  use GenServer
  @me __MODULE__
  # Server
  def init(:no_args) do
    {:ok, %{}}
  end

  def handle_cast({:add, path, hash}, results) do
    results =
      Map.update(
        # look in this map
        results,
        # for an entry with key
        hash,
        # if not found, store this value
        [path],
        # else update with result of this fn
        fn existing ->
          [path | existing]
        end
      )

    {:noreply, results}
  end

  def handle_call(:find_duplicates, _from, results) do
    {
      :reply,
      hashes_with_more_than_one_path(results),
      results
    }
  end

  defp hashes_with_more_than_one_path(results) do
    results
    |> Enum.filter(fn {_hash, paths} -> length(paths) > 1 end)
    |> Enum.map(&elem(&1, 1))
  end
end