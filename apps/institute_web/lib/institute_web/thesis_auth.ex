defmodule InstituteWeb.ThesisAuth do
  @moduledoc """
  Contains functions for handling Thesis authorization.
  """

  @behaviour Thesis.Auth

  import InstituteWeb.AuthPlug, only: [logged_in?: 1]

  def page_is_editable?(conn) do
    logged_in?(conn)
  end
end
