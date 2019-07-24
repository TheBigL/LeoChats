# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :leochats,
  ecto_repos: [Leochats.Repo]

# Configures the endpoint
config :leochats, Leochats.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qojc4uzHfu9psHPsSPo2i9twbuO+HQ7HNx7WwgAheI4ULGjmQhvXfQQbDV+qaAIt",
  render_errors: [view: Leochats.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Leochats.PubSub,
           adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "GgqtQ03OxhyLtyUydxSfh9kfqAffHb28"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Uses Jason for JSON Parsing
config :phoenix, :json_library, Jason

config :phoenix, :template_engines, leex: Phoenix.LiveView.Engine 

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
