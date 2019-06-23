use Mix.Config

database_url =
  System.get_env("TEST_DATABASE_URL") ||
    raise """
    environment variable TEST_DATABASE_URL is missing.
    For example: ecto://USER:PASS@HOST/DATABASE
    """

# Configure your database
config :institute, Institute.Repo,
  ssl: false,
  url: database_url,
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :institute, InstituteWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
