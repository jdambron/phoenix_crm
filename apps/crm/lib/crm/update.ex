defmodule Crm.Update do
  import Ecto.Changeset
  use Ecto.Schema
  alias Crm.{Update}

  schema "updates" do
    field(:activity, :string)
    field(:start, :date)
    field(:end, :date)
    field(:note, :string)
    many_to_many(:contacts, Crm.Contact, join_through: "updates_contacts")
    timestamps()
  end

  @required_fields ~w(activity start)a

  def changeset(%Update{} = update, params \\ %{}) do
    update
    |> cast(params, @required_fields)
    |> cast_assoc(:contacts, required: true)
    |> validate_required(@required_fields)
  end

  def changeset_update_contacts(%Update{} = update, params, contacts) do
    update
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
    |> put_assoc(:contacts, contacts)
  end
end
