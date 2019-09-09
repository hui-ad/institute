defmodule Institute.Schedule.Event do
  use Ecto.Schema
  import Ecto.Changeset
  alias Institute.Accounts.User

  schema "events" do
    belongs_to :creator, User, foreign_key: :creator_id
    
    field :address, :string
    field :description, :string
    field :event_end_datetime, :naive_datetime
    field :event_start_datetime, :naive_datetime
    field :event_timezone, :string
    field :location, :string
    field :sub_heading, :string
    field :title, :string
    field :video_url, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:title, :description, :sub_heading, :event_start_datetime, :event_timezone, :event_end_datetime, :location, :address, :video_url])
    |> validate_required([:title, :event_start_datetime, :event_timezone])
  end
end
