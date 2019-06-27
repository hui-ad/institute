defmodule Institute.Meetings do
  @moduledoc """
  The Meetings context
  """

  import Ecto.Query, only: [from: 2]
  
  alias Institute.Repo
  alias Thesis.Page

  @meeting_path "/meetings"

  def meeting_path(), do: @meeting_path
  
  def list_meetings do
    q = from p in Page, where: ilike(p.slug, ^"#{@meeting_path}/%")
    Repo.all(q)
  end
end
