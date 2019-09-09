defmodule InstituteWeb.TestHelpers do
  alias Institute.Accounts
  alias Institute.Repo

  def insert_user(attrs \\ %{}) do
    changes =
      Dict.merge(
        %{
          name: "Some User",
          username: "user#{Base.encode16(:crypto.strong_rand_bytes(8))}",
          password: "supersecret"
        },
        attrs
      )

    %Accounts.User{}
    |> Accounts.User.registration_changeset(changes)
    |> Repo.insert!()
  end
end
