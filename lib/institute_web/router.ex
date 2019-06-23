defmodule InstituteWeb.Router do
  use InstituteWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", InstituteWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/code_of_conduct", PageController, :code_of_conduct
  end

  # Other scopes may use custom stacks.
  # scope "/api", InstituteWeb do
  #   pipe_through :api
  # end
end
