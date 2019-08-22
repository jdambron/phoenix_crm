defmodule CrmWeb.ContactController do
  use CrmWeb, :controller

  def index(conn, _params) do
    contacts = Crm.list_contacts()
    render(conn, "index.html", contacts: contacts)
  end

  def show(conn, %{"id" => id}) do
      contact = Crm.get_contact(id)
      render(conn, "show.html", contact: contact)
  end
end
