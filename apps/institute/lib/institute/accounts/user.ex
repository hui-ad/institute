defmodule Institute.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Institute.Schedule.Event

  schema "users" do
    has_many :created_events, Event, foreign_key: :creator_id
    
    field(:name, :string)
    field(:username, :string)

    field(:password, :string, virtual: true)
    field(:password_hash, :string)

    timestamps()
  end

  def registration_changeset(user, params) do
    user
    |> changeset(params)
    |> cast(params, [:password], [])
    |> validate_length(:password, min: 6, max: 100)
    |> put_pass_hash()
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: pass}} = changeset) do
    put_change(changeset, :password_hash, Pbkdf2.hash_pwd_salt(pass))
  end

  defp put_pass_hash(changeset), do: changeset

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username])
    |> validate_required([:name, :username])
    |> validate_length(:username, min: 1, max: 20)
  end
end
