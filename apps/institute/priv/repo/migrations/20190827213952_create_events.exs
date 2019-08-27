defmodule Institute.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :title, :string
      add :description, :text
      add :sub_heading, :string
      add :event_start_datetime, :naive_datetime
      add :event_timezone, :string
      add :event_utc_offset, :string
      add :event_end_datetime, :naive_datetime
      add :location, :string
      add :address, :string
      add :video_url, :string
      add :creator_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:events, [:creator_id])
  end
end
