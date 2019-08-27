defmodule InstituteWeb.Router do
  use InstituteWeb, :router

  alias Institute.Meetings

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
    plug(InstituteWeb.AuthPlug)
  end

  pipeline :api do
    plug(:accepts, ["json"])
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
    get("#{Meetings.meeting_path()}", MeetingController, :index)
    get("#{Meetings.meeting_path()}/*path", MeetingController, :dynamic)
  end

  scope "/meeting", InstituteWeb do
    pipe_through(:browser)

    # get "/meeting/*path", MeetingController, :dynamic
    # get("/meeting/1", MeetingController, :page)
  end
  
  scope "/events", InstituteWeb do
    pipe_through(:browser)

    resources("/", EventController, only: [:index, :show, :new, :create])
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
