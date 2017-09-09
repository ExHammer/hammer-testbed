defmodule HammerTestbed.Mixfile do
  use Mix.Project

  def project do
    [app: :hammer_testbed,
     version: "0.0.1",
     elixir: "~> 1.5",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {HammerTestbed.Application, []},
     extra_applications: [:logger, :runtime_tools]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:phoenix, "~> 1.3.0-rc"},
     {:phoenix_pubsub, "~> 1.0"},
     {:phoenix_html, "~> 2.6"},
     {:phoenix_live_reload, "~> 1.0", only: :dev},
     {:gettext, "~> 0.11"},
     # {:hammer, "~> 1.0.0"},
     # {:hammer, [git: "https://github.com/ExHammer/hammer.git", branch: "issue-12-new-api"]},
     {:hammer, path: "../hammer"},
     # {:hammer_backend_redis, "~> 0.1.0"},
     {:hammer_backend_redis, path: "../hammer_backend_redis"},
     # {:hammer_backend_redis, [git: "https://github.com/ExHammer/hammer-backend-redis.git",
     #                          branch: "issue-8-update-to-new-api"]},
     {:cowboy, "~> 1.0"}]
  end
end
