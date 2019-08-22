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

  def new(conn, _params) do
    contact = Crm.new_contact()
    render(conn, "new.html", contact: contact)
  end

  def create(conn, %{"contact" => contact_params}) do
    case Crm.insert_contact(contact_params) do
      {:ok, contact} -> redirect(conn, to: Routes.contact_path(conn, :show, contact))
      {:error, contact} -> render(conn, "new.html", contact: contact)
    end
  end

  def delete(conn, %{"id" => id}) do
    contact = Crm.get_contact(id)
    Crm.delete_contact(contact)
    redirect(conn, to: Routes.contact_path(conn, :index))
  end
end
