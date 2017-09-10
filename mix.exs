defmodule GitFinder.Mixfile do
  use Mix.Project

  def project do
    [
      app: :gitfinder,
      version: "0.1.0",
      elixir: "~> 1.5.1",
      escript: [main_module: Main],
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:git_cli, "~> 0.2"},
      {:bunt, "~> 0.1.0"}
    ]
  end
end
