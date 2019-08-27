defmodule CrmWeb.GlobalHelpers do
  def get_full_name(%Crm.Contact{} = contact) do
    contact.first_name <> " " <> contact.last_name
  end
end
