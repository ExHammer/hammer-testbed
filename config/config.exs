# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :hammer_testbed, HammerTestbed.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "0/kuOGym1R7/Y1LGx4+vloUAl6B+PnQbA9RROlHDHV2zL8Ax7Z/fY+rBd65+CfR0",
  render_errors: [view: HammerTestbed.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: HammerTestbed.PubSub,
           adapter: Phoenix.PubSub.PG2]

## Hammer with ETS backend

config :hammer,
  backend: {Hammer.Backend.ETS, [pool_size: 2]}


## Hammer with Redis backend

# config :hammer,
#   backend: {Hammer.Backend.Redis, [expiry_ms: 60_000 * 2,
#                                    redix_config: [],
#                                    pool_size: 6]}


## Hammer with multiple backends

# config :hammer,
#   backend: [
#     ets: {Hammer.Backend.ETS, []},
#     redis: {Hammer.Backend.Redis, []}
#   ]


## Hammer with multiple backends, and with multiple redis's

# config :hammer,
#   backend: [
#     ets: {Hammer.Backend.ETS, []},
#     redis_one: {Hammer.Backend.Redis, []},
#     redis_two: {Hammer.Backend.Redis, [expiry_ms: 60_000 * 1,
#                                        redix_config: [port: 7777],
#                                        pool_size: 6]}
#   ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
