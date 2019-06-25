defmodule InstituteWeb.Router do
  use InstituteWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
    plug InstituteWeb.Auth
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  pipeline :require_login do
    plug(InstituteWeb.RequireAuth)
  end

  scope "/auth", InstituteWeb do
    pipe_through(:browser)

    get("/:provider", AuthController, :request)
    # get("/:provider/callback", AuthController, :callback)
    post("/identity/callback", AuthController, :identity_callback)
    delete("/logout/:id", AuthController, :delete)
  end

  scope "/", InstituteWeb do
    pipe_through(:browser)

    get("/", PageController, :index)
    get("/code_of_conduct", PageController, :code_of_conduct)
    resources("/users", UserController, only: [:index, :show, :new, :create])
  end

  scope "/admin", InstituteWeb do
    pipe_through([:browser, :authenticate_user])
    
    get("/", PageController, :secret)
  end
  
  # Other scopes may use custom stacks.
  # scope "/api", InstituteWeb do
  #   pipe_through :api
  # end
end
