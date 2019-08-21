defmodule Crm.Repo.Migrations.CreateUpdates do
  use Ecto.Migration

  def change do
    create table("updates") do
      add :activity, :string, null: false
      add :start, :date, null: false
      add :end, :date
      add :note, :text
      timestamps()
    end

    create table("updates_contacts") do
      add :update_id, references(:updates)
      add :contact_id, references(:contacts)
    end

    create unique_index(:updates_contacts, [:update_id, :contact_id])
  end
end
