defmodule Institute.Schedule.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :address, :string
    field :description, :string
    field :event_end_datetime, :naive_datetime
    field :event_start_datetime, :naive_datetime
    field :event_timezone, :string
    field :event_utc_offset, :string
    field :location, :string
    field :sub_heading, :string
    field :title, :string
    field :video_url, :string
    field :creator_id, :id

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:title, :description, :sub_heading, :event_start_datetime, :event_timezone, :event_utc_offset, :event_end_datetime, :location, :address, :video_url])
    |> validate_required([:title, :description, :sub_heading, :event_start_datetime, :event_timezone, :event_utc_offset, :event_end_datetime, :location, :address, :video_url])
  end
end
