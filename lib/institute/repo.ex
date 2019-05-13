defmodule Institute.Repo do
  use Ecto.Repo,
    otp_app: :institute,
    adapter: Ecto.Adapters.Postgres
end
