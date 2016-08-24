defmodule Stack do
  use Plug.Builder

  plug Prometheus.PlugsInstrumenter
  plug Prometheus.PlugsExporter
  plug HelloWorldPlug, []
end
