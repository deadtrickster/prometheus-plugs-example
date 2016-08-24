defmodule PrometheusPlugsExample do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Prometheus.PlugsInstrumenter.setup()
    Prometheus.PlugsExporter.setup()

    children = [
      Plug.Adapters.Cowboy.child_spec(:http, Stack, [], [port: 4001])
    ]

    opts = [strategy: :one_for_one, name: PrometheusPlugsExample.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
