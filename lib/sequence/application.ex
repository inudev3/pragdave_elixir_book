defmodule Sequence.Application do
  @moduledoc false
  use Application

  def start(_type, _args) do
    children = [
      {Sequence, 123}
    ]

    opts = [strategy: :rest_for_one, name: Sequence.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
