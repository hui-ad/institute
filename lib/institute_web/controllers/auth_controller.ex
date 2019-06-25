defmodule InstituteWeb.AuthController do
  @moduledoc """
  Auth controller responsible for handling Ueberauth responses
  """

  use InstituteWeb, :controller
  plug(Ueberauth)

  alias Ueberauth.Strategy.Helpers
  alias Institute.Accounts

  def request(conn, _params) do
    render(conn, "request.html", callback_url: Helpers.callback_url(conn))
  end

  def delete(conn, _params) do
    conn
    |> InstituteWeb.Auth.logout()
    |> put_flash(:info, "You have been logged out!")
    |> redirect(to: "/")
  end

  def identity_callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    username = auth.uid
    password = auth.credentials.other.password
    case Accounts.authenticate_by_username_and_pass(username, password) do
      {:ok, user} ->
        conn
        |> InstituteWeb.Auth.login(user)
        |> put_flash(:info, "Successfully authenticated")
        |> redirect(to: "/")

      {:error, _reason} ->
        conn
        |> put_flash(:error, "Invalid username/password combination")
        |> redirect(to: "/")
    end
  end
end
