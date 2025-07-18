defmodule ApexErp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ApexErpWeb.Telemetry,
      ApexErp.Repo,
      {DNSCluster, query: Application.get_env(:apex_erp, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: ApexErp.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: ApexErp.Finch},
      # Start a worker by calling: ApexErp.Worker.start_link(arg)
      # {ApexErp.Worker, arg},
      # Start to serve requests, typically the last entry
      ApexErpWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ApexErp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ApexErpWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
