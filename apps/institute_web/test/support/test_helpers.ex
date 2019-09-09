defmodule InstituteWeb.TestHelpers do
  alias Institute.Accounts
  alias Institute.Repo

  defp default_user() do
    %{
      name: "Some User",
      username: "user#{System.unique_integer([:positive])}",
      password: "supersecret"
    }
  end

  def insert_user(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(default_user())
      |> Institute.Accounts.register_user()
    user
  end
end
