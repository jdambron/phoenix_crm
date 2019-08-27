defmodule CrmWeb.UpdateController do
  use CrmWeb, :controller

  def new(conn, _params) do
    update = Crm.new_update()
    contacts = Crm.list_contacts()
    render(conn, "new.html", update: update, contacts: contacts)
  end

  def create(conn, %{"update" => update_params}) do
    case Crm.insert_update(update_params) do
      {:ok, _update} ->
        conn
        |> put_flash(:info, "Update correctly added")
        |> redirect(to: Routes.contact_path(conn, :index))

      {:error, update} ->
        render(conn, "new.html", update: update, contacts: Crm.list_contacts())
    end
  end
end
