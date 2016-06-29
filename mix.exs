defmodule PrometheusPlugsExample.Mixfile do
  use Mix.Project

  def project do
    [app: :prometheus_plugs_example,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger, :cowboy, :plug, :prometheus],
     mod: {PrometheusPlugsExample, []}]
  end

  defp deps do
    [{:prometheus_plugs, "~> 0.1"}]
  end
end
