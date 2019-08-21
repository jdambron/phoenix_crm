defmodule Crm.Update do
  use Ecto.Schema

  schema "updates" do
    field(:activity, :string)
    field(:start, :date)
    field(:end, :date)
    field(:note, :string)
    many_to_many(:contacts, Crm.Contact, join_through: "updates_contacts")
    timestamps()
  end
end
