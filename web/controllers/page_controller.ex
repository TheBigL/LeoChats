defmodule Leochats.PageController do
  use Leochats.Web, :controller

  def index(conn, _params) do
    Phoenix.LiveView.Controller.live_render(conn, LivechatWeb.Live.Index, session: %{})
  end
end
