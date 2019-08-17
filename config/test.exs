use Mix.Config

database_url =
  System.get_env("TEST_DATABASE_URL") ||
    "postgresql://postgres:postgres@localhost:5432/institute_test"

secret_key_base =
  System.get_env("SECRET_KEY_BASE") ||
    "tPyOu5CaZcRye8PiDdgniCnrx1bufmfHw9703W5AX03zmtE9iY02bKmAGLQpFBP2"

port_num = System.get_env("PORT") || "4002"

# Configure your database
config :institute, Institute.Repo,
  ssl: false,
  url: database_url,
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :institute_web, InstituteWeb.Endpoint,
  secret_key_base: secret_key_base,
  http: [port: port_num],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
