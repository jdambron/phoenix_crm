defmodule Crm.Contact do
  import Ecto.Changeset
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

  def changeset(contact, params \\ %{}) do
    contact
    |> cast(params, [:first_name, :last_name, :days_for_contact])
    |> validate_required([:first_name, :last_name, :days_for_contact])
    |> validate_number(:days_for_contact, greater_than: 0)
  end

  def changeset(contact, params, group) do
    changeset(contact, params)
    |> put_assoc(:group, group)
  end
end
