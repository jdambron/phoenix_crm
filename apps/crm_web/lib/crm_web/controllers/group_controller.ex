defmodule CrmWeb.GroupController do
  use CrmWeb, :controller

  def new(conn, _params) do
    group = Crm.new_group()
    render(conn, "new.html", group: group)
  end

  def create(conn, %{"group" => group}) do
    case Crm.insert_group(group) do
      {:ok, _group} ->
        conn
        |> put_flash(:info, "Group correctly created")
        |> redirect(to: Routes.group_path(conn, :index))

      {:error, group} ->
        render(conn, "new.html", group: group)
    end
  end

  def index(conn, _params) do
    groups = Crm.list_groups()
    render(conn, "index.html", groups: groups)
  end
end
