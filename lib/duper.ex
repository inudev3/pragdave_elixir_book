defmodule Duper do
  @results Duper.Results
  @finder Duper.PathFinder
  use Agent

  def start_link(root) do
    GenServer.start_link(@results, :no_args, name: @results)
    GenServer.start_link(__MODULE__, root, name: @finder)
  end

  def add_hash_for(path, hash) do
    GenServer.cast(@results, {:add, path, hash})
  end

  def find_duplicates() do
    GenServer.call(@results, :find_duplicates)
  end

  def next_path() do
    GenServer.call(@finder, :next_path)
  end
end
