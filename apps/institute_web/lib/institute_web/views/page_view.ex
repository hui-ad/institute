defmodule InstituteWeb.PageView do
  use InstituteWeb, :view

  alias Institute.Meetings

  def next_meeting do
    Meetings.next_meeting()
  end

  def fmt_mtg_content(%{content: content, type: "html"}) do
    raw(content)
  end

  def fmt_mtg_content(%{content: content, type: _type}) do
    content
  end

  @doc """
  Guards agains a nil stored in the DB.

  Returns blank as a last resort.
  """
  def fmt_mtg_content(_), do: ""
end
