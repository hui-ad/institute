defmodule Institute.Repo.Migrations.RemoveEventUtcOffsetFromEvents do
  use Ecto.Migration

  def up do
    alter table(:events) do
      remove :event_utc_offset
    end
  end

  def down do
    alter table(:events) do
      add :event_utc_offset, :string, null: false
    end
  end
end
