defmodule Crm do
  alias Crm.{Contact, Update}
  @repo Crm.Repo

  def list_contacts do
    @repo.all(Contact)
  end

  def insert_contact(attrs) do
    %Contact{}
    |> Contact.changeset(attrs)
    |> @repo.insert()
  end

  def insert_update(%{"contacts" => contact_ids} = update) do
    contacts = Enum.map(contact_ids, &Crm.get_contact/1)

    %Update{}
    |> @repo.preload(:contacts)
    |> Update.changeset_update_contacts(update, contacts)
    |> @repo.insert()
  end

  def insert_update(attrs) do
    %Update{}
    |> @repo.preload(:contacts)
    |> Update.changeset(attrs)
    |> @repo.insert()
  end

  def get_contact(id), do: @repo.get!(Contact, id)
  def new_contact, do: Contact.changeset(%Contact{})
  def delete_contact(%Contact{} = contact), do: @repo.delete!(contact)
  def new_update, do: Update.changeset(%Update{} |> @repo.preload(:contacts))
end
