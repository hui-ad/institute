defmodule Institute.Meetings do
  @moduledoc """
  The Meetings context
  """

  import Ecto.Query, only: [from: 2]

  alias Institute.Repo
  alias Institute.Meetings.MeetingContent
  alias Thesis.Page

  @meeting_path "/meetings"

  def meeting_path(), do: @meeting_path

  def list_meetings do
    q = from p in Page, where: ilike(p.slug, ^"#{@meeting_path}/%")
    Repo.all(q)
  end

  def next_meeting do
    q = from p in Page, order_by: [desc: p.id], limit: 1

    case Repo.one(q) do
      nil ->
        nil

      mtg_page ->
        info = MeetingContent.meeting_content(mtg_page.id)
        %{page: mtg_page, content: info}
    end
  end
end
