defmodule Institute.ScheduleTest do
  use Institute.DataCase

  alias Institute.Schedule

  describe "events" do
    alias Institute.Schedule.Event

    @valid_attrs %{address: "some address", description: "some description", event_end_datetime: ~N[2010-04-17 14:00:00], event_start_datetime: ~N[2010-04-17 14:00:00], event_timezone: "some event_timezone", event_utc_offset: "some event_utc_offset", location: "some location", sub_heading: "some sub_heading", title: "some title", video_url: "some video_url"}
    @update_attrs %{address: "some updated address", description: "some updated description", event_end_datetime: ~N[2011-05-18 15:01:01], event_start_datetime: ~N[2011-05-18 15:01:01], event_timezone: "some updated event_timezone", event_utc_offset: "some updated event_utc_offset", location: "some updated location", sub_heading: "some updated sub_heading", title: "some updated title", video_url: "some updated video_url"}
    @invalid_attrs %{address: nil, description: nil, event_end_datetime: nil, event_start_datetime: nil, event_timezone: nil, event_utc_offset: nil, location: nil, sub_heading: nil, title: nil, video_url: nil}

    def event_fixture(attrs \\ %{}) do
      {:ok, event} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Schedule.create_event()

      event
    end

    test "list_events/0 returns all events" do
      event = event_fixture()
      assert Schedule.list_events() == [event]
    end

    test "get_event!/1 returns the event with given id" do
      event = event_fixture()
      assert Schedule.get_event!(event.id) == event
    end

    test "create_event/1 with valid data creates a event" do
      assert {:ok, %Event{} = event} = Schedule.create_event(@valid_attrs)
      assert event.address == "some address"
      assert event.description == "some description"
      assert event.event_end_datetime == ~N[2010-04-17 14:00:00]
      assert event.event_start_datetime == ~N[2010-04-17 14:00:00]
      assert event.event_timezone == "some event_timezone"
      assert event.event_utc_offset == "some event_utc_offset"
      assert event.location == "some location"
      assert event.sub_heading == "some sub_heading"
      assert event.title == "some title"
      assert event.video_url == "some video_url"
    end

    test "create_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schedule.create_event(@invalid_attrs)
    end

    test "update_event/2 with valid data updates the event" do
      event = event_fixture()
      assert {:ok, %Event{} = event} = Schedule.update_event(event, @update_attrs)
      assert event.address == "some updated address"
      assert event.description == "some updated description"
      assert event.event_end_datetime == ~N[2011-05-18 15:01:01]
      assert event.event_start_datetime == ~N[2011-05-18 15:01:01]
      assert event.event_timezone == "some updated event_timezone"
      assert event.event_utc_offset == "some updated event_utc_offset"
      assert event.location == "some updated location"
      assert event.sub_heading == "some updated sub_heading"
      assert event.title == "some updated title"
      assert event.video_url == "some updated video_url"
    end

    test "update_event/2 with invalid data returns error changeset" do
      event = event_fixture()
      assert {:error, %Ecto.Changeset{}} = Schedule.update_event(event, @invalid_attrs)
      assert event == Schedule.get_event!(event.id)
    end

    test "delete_event/1 deletes the event" do
      event = event_fixture()
      assert {:ok, %Event{}} = Schedule.delete_event(event)
      assert_raise Ecto.NoResultsError, fn -> Schedule.get_event!(event.id) end
    end

    test "change_event/1 returns a event changeset" do
      event = event_fixture()
      assert %Ecto.Changeset{} = Schedule.change_event(event)
    end
  end
end
