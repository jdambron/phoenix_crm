defmodule Crm do
  alias Crm.{Contact, Update, Group}
  @repo Crm.Repo

  def list_contacts do
    @repo.all(Contact)
  end

  def insert_contact(%{"group" => group_id} = attrs) do
    group = Crm.get_group(group_id)

    %Contact{}
    |> Contact.changeset(attrs, group)
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

  def get_contact_with_preloads(id) do
    @repo.get!(Contact, id)
    |> @repo.preload([:group, :updates, :notes])
  end

  def list_groups do
    @repo.all(Group)
  end

  def insert_group(attrs) do
    %Group{}
    |> Group.changeset(attrs)
    |> @repo.insert()
  end

  def get_contact(id), do: @repo.get!(Contact, id)
  def new_contact, do: Contact.changeset(%Contact{} |> @repo.preload(:group))
  def delete_contact(%Contact{} = contact), do: @repo.delete!(contact)
  def new_update, do: Update.changeset(%Update{} |> @repo.preload(:contacts))
  def new_group(), do: Group.changeset(%Group{})
  def get_group(id), do: @repo.get!(Group, id)
end
