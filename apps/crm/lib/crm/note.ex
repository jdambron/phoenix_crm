defmodule Crm.Note do
  use Ecto.Schema

  schema "notes" do
    field(:content, :string)
    belongs_to(:contact, Crm.Contact)
    timestamps()
  end
end
