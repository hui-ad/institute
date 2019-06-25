defmodule InstituteWeb.PageController do
  use InstituteWeb, :controller

  @code_of_conduct_html Path.join(:code.priv_dir(:institute), "code-of-conduct.md")
                        |> File.read!()
                        |> Earmark.as_html!()

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def code_of_conduct(conn, _params) do
    html(conn, @code_of_conduct_html)
  end

  def secret(conn, _params), do: html(conn, "This is secret.")
end
