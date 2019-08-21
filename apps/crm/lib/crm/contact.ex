defmodule Crm.Contact do
  use Ecto.Schema

  schema "contacts" do
    field(:first_name, :string)
    field(:last_name, :string)
    field(:days_for_contact, :integer)
    belongs_to(:group, Crm.Group)
    has_many(:notes, Crm.Note)
    many_to_many(:updates, Crm.Update, join_through: "updates_contacts")
    timestamps()
  end
end
