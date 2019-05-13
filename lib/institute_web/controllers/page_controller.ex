defmodule InstituteWeb.PageController do
  use InstituteWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
