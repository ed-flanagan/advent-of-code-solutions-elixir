defmodule Advent.MixProject do
  use Mix.Project

  def project do
    [
      app: :advent,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: dialyzer()
    ]
  end

  def application do
    [
      extra_applications: [:eex]
    ]
  end

  defp deps do
    [
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0", only: [:dev, :test], runtime: false},
      {:req, "~> 0.3.0"},
      {:stream_data, "~> 0.5", only: [:dev, :test]}
    ]
  end

  defp dialyzer do
    [
      list_unused_filters: true,
      plt_add_apps: [:mix]
    ]
  end
end
