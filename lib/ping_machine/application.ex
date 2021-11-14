defmodule PingMachine.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {DynamicSupervisor, strategy: :one_for_one, name: PingMachine.PingSupervisor}

      # Starts a worker by calling: PingMachine.Worker.start_link(arg)
      # {PingMachine.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PingMachine.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
