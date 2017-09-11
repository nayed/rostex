# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :rostex,
  ecto_repos: [Rostex.Repo]

# Configures the endpoint
config :rostex, RostexWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "gp1thcAS6h7JDqq1Nm2Pk/UhrULIhv2VnCRW9GINdBfkBoggPtcSMW1+Qe+5/EtV",
  render_errors: [view: RostexWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Rostex.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
