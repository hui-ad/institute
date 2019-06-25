defmodule Institute.ThesisAuth do
  @moduledoc """
  Contains functions for handling Thesis authorization.
  """

  @behaviour Thesis.Auth

  def page_is_editable?(conn) do
    InstituteWeb.Auth.logged_in?(conn)
  end
end
