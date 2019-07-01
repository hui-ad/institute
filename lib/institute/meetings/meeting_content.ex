defmodule Institute.Meetings.MeetingContent do
  @moduledoc """
  Meeting Content from a Thesis Page
  """

  import Ecto.Query, only: [from: 2]

  alias Institute.Repo
  alias Thesis.PageContent

  @enforce_keys [
    :event_description,
    :event_title,
    :event_sub_heading,
    :event_time,
    :event_day,
    :event_location,
    :event_address
  ]
  defstruct [
    :event_description,
    :event_title,
    :event_sub_heading,
    :event_time,
    :event_day,
    :event_location,
    :event_address
  ]

  defp page_content(page_id) do
    q = from c in PageContent, where: c.page_id == ^page_id
    Repo.all(q)
  end

  def meeting_info([]), do: %{}

  def meeting_info(content_recs) do
    %__MODULE__{
      event_description: content(content_recs, "Event Description"),
      event_title: content(content_recs, "Meeting Title"),
      event_sub_heading: content(content_recs, "Meeting Sub-heading"),
      event_time: content(content_recs, "Time"),
      event_day: content(content_recs, "Day"),
      event_location: content(content_recs, "Location"),
      event_address: content(content_recs, "Address")
    }
  end

  def content(content_recs, name) do
    case Enum.find(content_recs, &(&1.name == name)) do
      nil -> nil
      rec -> %{content: rec.content, type: rec.content_type}
    end
  end

  def meeting_content(page_id) do
    page_content_recs = page_content(page_id)
    meeting_info(page_content_recs)
  end
end
