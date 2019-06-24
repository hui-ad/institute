defmodule InstituteWeb.Router do
  use InstituteWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  # scope "/auth", InstituteWeb do
  #   pipe_through(:browser)

  #   get("/:provider", AuthController, :request)
  #   get("/:provider/callback", AuthController, :callback)
  #   post("/identity/callback", AuthController, :identity_callback)
  # end

  scope "/", InstituteWeb do
    pipe_through(:browser)

    get("/", PageController, :index)
    get("/code_of_conduct", PageController, :code_of_conduct)
    resources("/users", UserController, only: [:index, :show, :new, :create])
  end

  # Other scopes may use custom stacks.
  # scope "/api", InstituteWeb do
  #   pipe_through :api
  # end
end
