# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Institute.Repo.insert!(%Institute.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Institute.Accounts
Accounts.register_user(%{name: "Kyle Oba", username: "koba", password: "temppass"})
