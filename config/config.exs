# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of the Config module.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
import Config

config :crm_web,
  generators: [context_app: false]

# Configures the endpoint
config :crm_web, CrmWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "EyL56t4sIUG1zKvWA2vhhNbimDw/7NWFJmfAsdKk2q74Nj1pqp3fsVdnbMiQl+dp",
  render_errors: [view: CrmWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CrmWeb.PubSub, adapter: Phoenix.PubSub.PG2]

# Sample configuration:
#
#     config :logger, :console,
#       level: :info,
#       format: "$date $time [$level] $metadata$message\n",
#       metadata: [:user_id]
#

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Configure repo
config :crm, ecto_repos: [Crm.Repo]

config :crm, Crm.Repo,
  database: "crm",
  username: "postgres",
  password: "y160Lpl0DKhSF2TiGxli",
  hostname: "localhost",
  port: "5432"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
