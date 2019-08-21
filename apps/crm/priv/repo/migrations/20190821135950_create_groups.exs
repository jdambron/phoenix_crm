defmodule Crm.Repo.Migrations.CreateGroups do
  use Ecto.Migration

  def change do
    create table("groups") do
      add :name, :string
      timestamps()
    end

    alter table(:contacts) do
      add :group_id, references(:groups)
    end

    create index :contacts, [:group_id]
  end
end
