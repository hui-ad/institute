# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

config :hello_web,
  generators: [context_app: false]

secret_key_base =
  System.get_env("SECRET_KEY_BASE") ||
    raise """
    environment variable SECRET_KEY_BASE is missing.
    You can generate one by calling: mix phx.gen.secret
    """

live_view_signing_salt =
  System.get_env("LIVE_VIEW_SIGNING_SALT") ||
    raise """
    environment variable LIVE_VIEW_SIGNING_SALT is missing.
    """

# Configures the endpoint
config :hello_web, HelloWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: secret_key_base,
  render_errors: [view: HelloWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: HelloWeb.PubSub,
  live_view: [signing_salt: live_view_signing_salt]

# Configure Mix tasks and generators
config :institute,
  ecto_repos: [Institute.Repo]

config :institute_web,
  # ecto_repos: [Institute.Repo],
  ecto_repos: [],
  generators: [context_app: :institute]

# Configures the endpoint
config :institute_web, InstituteWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: secret_key_base,
  render_errors: [view: InstituteWeb.ErrorView, accepts: ~w(html json)],
  pubsub_server: InstituteWeb.PubSub

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :ueberauth, Ueberauth,
  providers: [
    identity:
      {Ueberauth.Strategy.Identity,
       [
         callback_methods: ["POST"],
         nickname_field: :username,
         param_nesting: "user",
         uid_field: :username
       ]}
  ]

config :master_proxy,
  # any Cowboy options are allowed
  http: [:inet6, port: System.get_env("PORT") || 4000],
  backends: [
    %{
      path: ~r{^/hello},
      phoenix_endpoint: HelloWeb.Endpoint
    },
    %{
      path: ~r{^.*},
      phoenix_endpoint: InstituteWeb.Endpoint
    }
  ]

# Thesis Main Config
config :thesis,
  store: Thesis.EctoStore,
  authorization: InstituteWeb.ThesisAuth,
  uploader: Thesis.RepoUploader

# Thesis Store Config
config :thesis, Thesis.EctoStore, repo: Institute.Repo

# Thesis Notifications Config
# config :thesis, :notifications,
#   add_page: [],
#   page_settings: [],
#   import_export_restore: []

# Thesis Dynamic Pages Config
config :thesis, :dynamic_pages,
  view: InstituteWeb.MeetingView,
  templates: ["page.html"],
  not_found_view: InstituteWeb.ErrorView,
  not_found_template: "404.html"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
