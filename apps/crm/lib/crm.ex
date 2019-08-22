defmodule Crm do
  alias Crm.Contact
  @repo Crm.Repo

  def list_contacts do
    @repo.all(Contact)
  end

  def insert_contact(attrs) do
    %Contact{}
    |> Contact.changeset(attrs)
    |> @repo.insert()
  end

  def get_contact(id), do: @repo.get!(Contact, id)
  def new_contact, do: Contact.changeset(%Contact{})
  def delete_contact(%Contact{} = contact), do: @repo.delete!(contact)
end
