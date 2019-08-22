defmodule Crm do
  alias Crm.Contact
  @repo Crm.Repo

  def list_contacts do
    @repo.all(Contact)
  end

  def get_contact(id), do: @repo.get!(Contact, id)
end
