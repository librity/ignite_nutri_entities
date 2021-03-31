# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :nutri,
  ecto_repos: [Nutri.Repo]

# Configures the endpoint
config :nutri, NutriWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Aphs6QPe9kmFfd60+c6F849emKmURNKgVizHVW19binuLXSMHTCGy6P8Pb/j6Gso",
  render_errors: [view: NutriWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Nutri.PubSub,
  live_view: [signing_salt: "4SEs8Rtq"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
