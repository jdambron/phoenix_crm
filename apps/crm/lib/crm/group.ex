defmodule Crm.Group do
  import Ecto.Changeset
  use Ecto.Schema

  schema "groups" do
    field(:name, :string)
    has_many(:contacts, Crm.Contact)
    timestamps()
  end

  def changeset(group, params \\ %{}) do
    group
    |> cast(params, [:name])
    |> validate_required(:name)
    |> validate_length(:name, min: 2)
  end
end
