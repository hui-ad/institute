defmodule InstituteWeb.MeetingController do
  use InstituteWeb, :controller

  alias Institute.Meetings
  
  # def page(conn, _params) do
  #   render(conn, "page.html")
  # end
  def dynamic(conn, _params) do
    render_dynamic(conn)
  end

  def index(conn, _params) do
    conn =
      conn
      |> assign(:meetings, Meetings.list_meetings())
    render(conn, "index.html")
  end
end
