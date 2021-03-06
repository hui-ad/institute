defmodule InstituteWeb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the Telemetry supervisor
      InstituteWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, [name: InstituteWeb.PubSub, adapter: Phoenix.PubSub.PG2]},
      # Start InstituteWeb presence
      # InstituteWeb.Presence,
      # Start the endpoint when the application starts
      InstituteWeb.Endpoint
      # Starts a worker by calling: InstituteWeb.Worker.start_link(arg)
      # {InstituteWeb.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: InstituteWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    InstituteWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
