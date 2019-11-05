# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :apibox_demo,
  ecto_repos: [ApiboxDemo.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :apibox_demo, ApiboxDemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "w1joYbvqbGIPzA7FfyAneiCFLtlFwREyN3rW5k2jlT6bY3p18d0ZveSBC/sQTfl+",
  render_errors: [view: ApiboxDemoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ApiboxDemo.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
