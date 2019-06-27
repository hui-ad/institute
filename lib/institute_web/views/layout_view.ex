defmodule InstituteWeb.LayoutView do
  use InstituteWeb, :view

  alias InstituteWeb.MeetingController
  alias InstituteWeb.PageController

  def show_thesis_editor?(conn) do
    action = conn.private.phoenix_action
    controller = conn.private.phoenix_controller
    show_menu_on_page?({controller, action})
  end

  defp show_menu_on_page?({PageController, :index}), do: true
  defp show_menu_on_page?({MeetingController, _action}), do: true
  defp show_menu_on_page?({_, _}), do: false
end
