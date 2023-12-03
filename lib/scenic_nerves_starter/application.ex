defmodule ScenicNervesStarter.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ScenicNervesStarter.Supervisor]

    scenic_viewport_config = Application.get_env(:scenic_nerves_starter, :viewport)

    children =
      [
        {Scenic, [scenic_viewport_config]}
      ] ++ children(target())

    Supervisor.start_link(children, opts)
  end

  # List all child processes to be supervised
  def children(:host) do
    [
      # Children that only run on the host
      # Starts a worker by calling: ScenicNervesStarter.Worker.start_link(arg)
      # {ScenicNervesStarter.Worker, arg},
    ]
  end

  def children(_target) do
    [
      # Children for all targets except host
      # Starts a worker by calling: ScenicNervesStarter.Worker.start_link(arg)
      # {ScenicNervesStarter.Worker, arg},
    ]
  end

  def target() do
    Application.get_env(:scenic_nerves_starter, :target)
  end
end
