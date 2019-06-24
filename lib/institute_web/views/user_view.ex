defmodule InstituteWeb.UserView do
  use InstituteWeb, :view

  alias Institute.Accounts

  def first_name(%Accounts.User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end
