defmodule Crm.Group do
  use Ecto.Schema

  schema "groups" do
    field(:name, :string)
    has_many(:contacts, Crm.Contact)
    timestamps()
  end
end
