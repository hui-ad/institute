defmodule InstituteWeb.EventControllerTest do
  use InstituteWeb.ConnCase

  alias Institute.Schedule

  @create_attrs %{address: "some address", description: "some description", event_end_datetime: ~N[2010-04-17 14:00:00], event_start_datetime: ~N[2010-04-17 14:00:00], event_timezone: "some event_timezone", location: "some location", sub_heading: "some sub_heading", title: "some title", video_url: "some video_url"}
  @update_attrs %{address: "some updated address", description: "some updated description", event_end_datetime: ~N[2011-05-18 15:01:01], event_start_datetime: ~N[2011-05-18 15:01:01], event_timezone: "some updated event_timezone", location: "some updated location", sub_heading: "some updated sub_heading", title: "some updated title", video_url: "some updated video_url"}
  @invalid_attrs %{address: nil, description: nil, event_end_datetime: nil, event_start_datetime: nil, event_timezone: nil, location: nil, sub_heading: nil, title: nil, video_url: nil}

  def fixture(:event) do
    {:ok, event} = Schedule.create_event(@create_attrs)
    event
  end

  setup do
    user = insert_user()
    conn = assign(conn(), :current_user, user)
    {:ok, conn: conn, user: user}
  end
  
  describe "index" do
    test "lists all events", %{conn: conn} do
      conn = get(conn, Routes.event_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Events"
    end
  end

  describe "new event" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.event_path(conn, :new))
      assert html_response(conn, 200) =~ "New Event"
    end
  end

  describe "create event" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.event_path(conn, :create), event: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.event_path(conn, :show, id)

      conn = get(conn, Routes.event_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Event"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.event_path(conn, :create), event: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Event"
    end
  end

  describe "edit event" do
    setup [:create_event]

    test "renders form for editing chosen event", %{conn: conn, event: event} do
      conn = get(conn, Routes.event_path(conn, :edit, event))
      assert html_response(conn, 200) =~ "Edit Event"
    end
  end

  describe "update event" do
    setup [:create_event]

    test "redirects when data is valid", %{conn: conn, event: event} do
      conn = put(conn, Routes.event_path(conn, :update, event), event: @update_attrs)
      assert redirected_to(conn) == Routes.event_path(conn, :show, event)

      conn = get(conn, Routes.event_path(conn, :show, event))
      assert html_response(conn, 200) =~ "some updated address"
    end

    test "renders errors when data is invalid", %{conn: conn, event: event} do
      conn = put(conn, Routes.event_path(conn, :update, event), event: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Event"
    end
  end

  describe "delete event" do
    setup [:create_event]

    test "deletes chosen event", %{conn: conn, event: event} do
      conn = delete(conn, Routes.event_path(conn, :delete, event))
      assert redirected_to(conn) == Routes.event_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.event_path(conn, :show, event))
      end
    end
  end

  defp create_event(_) do
    event = fixture(:event)
    {:ok, event: event}
  end
end
