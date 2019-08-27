defmodule Institute.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :title, :string, null: false
      add :description, :text
      add :sub_heading, :string
      add :event_start_datetime, :naive_datetime, null: false
      add :event_timezone, :string, null: false
      add :event_utc_offset, :string, null: false
      add :event_end_datetime, :naive_datetime
      add :location, :string
      add :address, :string
      add :video_url, :string
      add :creator_id, references(:users, on_delete: :nothing)

      timestamps(type: :timestamptz)
    end

    create index(:events, [:creator_id])
  end
end
