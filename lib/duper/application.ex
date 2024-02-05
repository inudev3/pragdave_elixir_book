defmodule Duper.Application do
  @moduledoc false
  use Application

  def start(_type, _args) do
    children = [
      {Duper, "."}
    ]

    opts = [strategy: :rest_for_one, name: Duper.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
