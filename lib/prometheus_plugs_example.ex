defmodule PrometheusPlugsExample do
  use Application

  @prometheus_labels [:code, :method, :host, :scheme]

  def prometheus_labels do
    @prometheus_labels
  end

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Plug.PrometheusCollector.setup(labels: @prometheus_labels)
    Plug.PrometheusExporter.setup()

    children = [
      Plug.Adapters.Cowboy.child_spec(:http, Stack, [], [port: 4001])
    ]

    opts = [strategy: :one_for_one, name: PrometheusPlugsExample.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
