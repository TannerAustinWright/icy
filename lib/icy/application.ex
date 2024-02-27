defmodule Icy.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  require Logger

  @impl true
  def start(type, args) do
    Logger.info(inspect(type: type, args: args))

    children = [
      Icy.Repo,
      {Oban, Application.fetch_env!(:icy, Oban)}
    ]

    opts = [strategy: :one_for_one, name: Icy.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
