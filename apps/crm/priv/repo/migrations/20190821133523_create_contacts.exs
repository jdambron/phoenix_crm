defmodule Crm.Repo.Migrations.CreateContacts do
  use Ecto.Migration

  def change do
    create table("contacts") do
    add :first_name, :string
    add :last_name, :string
    add :days_for_contact, :integer
    timestamps()
    end
  end
end
