defmodule Crm.Repo.Migrations.CreateNotes do
  use Ecto.Migration

  def change do
    create table("notes") do
      add :content, :text
      add :contact_id, references(:contacts)
      timestamps()
    end

    create index :notes, [:contact_id]
  end
end
