defmodule ExqUi.Mixfile do
  use Mix.Project

  def project do
    [ app: :exq_ui,
      version: "0.7.1",
      elixir: "~> 1.0.0 or ~> 1.1.1 or ~> 1.2",
      elixirc_paths: ["lib", "web"],
      package: [
        maintainers: ["Alex Kira", "Justin McNally", "Nick Sanders"],
        links: %{"GitHub" => "https://github.com/akira/exq"},
        files: ~w(lib priv test web) ++
               ~w(LICENSE mix.exs README.md)
      ],
      description: """
      Exq UI is the UI component for Exq, a job processing library.  Exq UI provides the UI dashboard
      to display stats on job processing.
      """,
      deps: deps,
      test_coverage: [tool: ExCoveralls]
    ]
  end

  # Configuration for the OTP application
  def application do
    [
      mod: { ExqUi, [] },
      applications: [:logger, :tzdata, :redix, :timex]
    ]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, "0.1", git: "https://github.com/elixir-lang/foobar.git" }
  defp deps do
    [
      { :exq, ">= 0.0.0"},
      { :plug, ">= 0.8.1 and < 2.0.0"},
      { :cowboy, "~> 1.0" },
      { :excoveralls, "~> 0.3", only: :test }
    ]
  end
end
