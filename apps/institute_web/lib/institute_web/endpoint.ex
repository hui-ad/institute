defmodule InstituteWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :institute_web

  socket "/socket", InstituteWeb.UserSocket,
    websocket: true,
    longpoll: false

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phx.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/",
    from: :institute_web,
    gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.

  env_salt = System.get_env("SESSION_SIGNING_SALT")

  signing_salt =
    cond do
      !is_nil(env_salt) ->
        env_salt

      :dev == Mix.env() || :test == Mix.env() ->
        "zqM3hNve"
        
      :prod == Mix.env() ->
        raise """
        environment variable SESSION_SIGNING_SALT is missing.
        Do not hard code this value.
        """
    end
  
  plug Plug.Session,
    store: :cookie,
    key: "_institute_web_key",
    signing_salt: signing_salt

  plug InstituteWeb.Router
end
