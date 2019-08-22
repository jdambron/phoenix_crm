use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :crm_web, CrmWeb.Endpoint,
  http: [port: 4002],
  server: false

config :crm, Crm.Repo,
  database: "crm_test",
  username: "postgres",
  password: "y160Lpl0DKhSF2TiGxli",
  hostname: "localhost",
  port: "5432",
  pool: Ecto.Adapters.SQL.Sandbox

config :logger, level: :info
