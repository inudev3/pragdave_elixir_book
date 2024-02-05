defmodule Duper.PathFinder do
  use GenServer
  @me PathFinder

  def init(path) do
    DirWalker.start_link(path)
  end

  def handle_call(:next_path, _from, dir_walker) do
    path =
      case DirWalker.next(dir_walker) do
        [path] -> path
        other -> other
      end

    {:reply, path, dir_walker}
  end
end
