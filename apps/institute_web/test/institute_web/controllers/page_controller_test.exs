defmodule InstituteWeb.PageControllerTest do
  use InstituteWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to the Institute"
  end
end
