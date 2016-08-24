defmodule Stack do
  use Plug.Builder

  plug Prometheus.PlugsInstrumenter
  plug Prometheus.PlugsExporter
  plug HelloWorldPlug, []
end

defmodule MyPlugLables do
  def label_value(:request_path, conn) do
    conn.request_path
  end
end
