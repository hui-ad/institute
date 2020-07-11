defmodule Institute.Umbrella.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      releases: [
        full: [
          version: "0.0.1",
          applications: [institute: :permanent, institute_web: :permanent, hello_web: :permanent]
        ]
      ]
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options.
  #
  # Dependencies listed here are available only for this project
  # and cannot be accessed from applications inside the apps folder
  defp deps do
    [
    ]
  end

  defp aliases do
    [
      "test.setup": [
        "cmd MIX_ENV=test mix ecto.setup"
      ],
      "ecto.setup": ["ecto.create", "ecto.migrate", "run apps/institute/priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"]
    ]
  end
end
