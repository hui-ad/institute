use Mix.Config

# For production, don't forget to configure the url host
# to something meaningful, Phoenix uses this information
# when generating URLs.
#
# Note we also include the path to a cache manifest
# containing the digested version of static files. This
# manifest is generated by the `mix phx.digest` task,
# which you should run after static files are built and
# before starting your production server.

app_name = (System.get_env("APP_NAME") || "institute") <> ".gigalixirapp.com"

config :institute_web, InstituteWeb.Endpoint,
  # Needed for Phoenix 1.2 and 1.4. Doesn't hurt for 1.3.
  http: [port: {:system, "PORT"}],
  url: [host: app_name, port: 443],
  cache_static_manifest: "priv/static/cache_manifest.json",
  # Without this line, your app will not start the web server!
  server: true,
  # Gigalixir force SSL (redirect http to https):
  force_ssl: [rewrite_on: [:x_forwarded_proto]]

database_url =
  System.get_env("DATABASE_URL") ||
    raise """
    environment variable DATABASE_URL is missing.
    For example: ecto://USER:PASS@HOST/DATABASE
    """

config :institute, Institute.Repo,
  ssl: true,
  url: database_url,
  # Free tier db only allows 4 connections. Rolling deploys need pool_size*(n+1) connections.
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "2")

# Do not print debug messages in production
config :logger, level: :info

# ## SSL Support
#
# To get SSL working, you will need to add the `https` key
# to the previous section and set your `:url` port to 443:
#
#     config :institute, InstituteWeb.Endpoint,
#       ...
#       url: [host: "example.com", port: 443],
#       https: [
#         :inet6,
#         port: 443,
#         cipher_suite: :strong,
#         keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#         certfile: System.get_env("SOME_APP_SSL_CERT_PATH")
#       ]
#
# The `cipher_suite` is set to `:strong` to support only the
# latest and more secure SSL ciphers. This means old browsers
# and clients may not be supported. You can set it to
# `:compatible` for wider support.
#
# `:keyfile` and `:certfile` expect an absolute path to the key
# and cert in disk or a relative path inside priv, for example
# "priv/ssl/server.key". For all supported SSL configuration
# options, see https://hexdocs.pm/plug/Plug.SSL.html#configure/1
#
# We also recommend setting `force_ssl` in your endpoint, ensuring
# no data is ever sent via http, always redirecting to https:
#
#     config :institute, InstituteWeb.Endpoint,
#       force_ssl: [hsts: true]
#
# Check `Plug.SSL` for all available options in `force_ssl`.

# ## Using releases (Elixir v1.9+)
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start each relevant endpoint:
#
#     config :institute, InstituteWeb.Endpoint, server: true
#
# Then you can assemble a release by calling `mix release`.
# See `mix help release` for more information.
