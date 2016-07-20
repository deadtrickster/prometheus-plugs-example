defmodule Stack do
  use Plug.Builder

  plug Plug.PrometheusCollector, PrometheusPlugsExample.prometheus_labels
  plug Plug.PrometheusExporter, []
  plug HelloWorldPlug, []
end
