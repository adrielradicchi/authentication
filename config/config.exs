# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :api,
  ecto_repos: [Api.Repo]

# Configures the endpoint
config :api, ApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "B8Fck+8NP445Cm6SMDkNwL+sMakykoNh95uFXSANBF1VL+18/E7bT3fIIJQAdPbb",
  render_errors: [view: ApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Api.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Guardian config
config :api, Api.Guardian,
       issuer: "api",
       secret_key: "0rUFVjl0A5JU37kmvc4+rkOC8y2pEtS7rSzlExSSEjxp6UzRScCNQk5gIAL2u+Im"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
