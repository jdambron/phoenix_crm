defmodule CrmTest do
  use ExUnit.Case
  alias Crm.{Contact, Repo}
  doctest Crm

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  describe "list_contacts/0" do
    setup do
      {:ok, contact1} = Repo.insert(%Contact{first_name: "James", last_name: "Bond"})
      {:ok, contact2} = Repo.insert(%Contact{first_name: "John", last_name: "Snow"})
      {:ok, contact3} = Repo.insert(%Contact{first_name: "Austin", last_name: "Powers"})
      %{contacts: [contact1, contact2, contact3]}
    end

    test "returns all Contacts in the database", %{contacts: contacts} do
      assert contacts == Crm.list_contacts()
    end
  end

  describe "get_contact/1" do
    setup do
      {:ok, contact1} = Repo.insert(%Contact{first_name: "James", last_name: "Bond"})
      {:ok, contact2} = Repo.insert(%Contact{first_name: "John", last_name: "Snow"})
      {:ok, contact3} = Repo.insert(%Contact{first_name: "Austin", last_name: "Powers"})
      %{contacts: [contact1, contact2, contact3]}
    end

    test "returns a single Contact based on id", %{contacts: contacts} do
      contact = Enum.at(contacts, 1)
      assert contact == Crm.get_contact(contact.id)
    end
  end
end
