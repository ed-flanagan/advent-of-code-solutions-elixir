defmodule Advent.MixProject do
  use Mix.Project

  def project do
    [
      app: :advent,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  defp deps do
    [
      # {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:credo,
       git: "https://github.com/rrrene/credo.git",
       tag: "b9d99da01b8c9a881d7ade5630c553623d31b503",
       only: [:dev, :test],
       runtime: false},
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false},
      {:stream_data, "~> 0.5", only: [:dev, :test]}
    ]
  end
end
