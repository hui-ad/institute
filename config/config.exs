# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :institute,
  ecto_repos: [Institute.Repo]

# Configures the endpoint
config :institute, InstituteWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "z1g7NzAk3nicx90DAW+R8apAkSGsde6WrK+e3x/De9c3ccdfQKQL8QLfXltDVIf1",
  render_errors: [view: InstituteWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Institute.PubSub, adapter: Phoenix.PubSub.PG2]

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

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

# Thesis Main Config
config :thesis,
  store: Thesis.EctoStore,
  authorization: Institute.ThesisAuth,
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
