defmodule Stack do
  use Plug.Builder

  plug Plug.PrometheusCollector, [labels: [:code, :method, :host, :scheme]]
  plug Plug.PrometheusExporter, []
  plug HelloWorldPlug, []
end
