defmodule LeochatsWeb.ChatView do
  use LeochatsWeb, :controller

  def index(conn, _params) do
    Phoenix.LiveView.Controller.live_render(conn, LeochatsWeb.Live.Index, session: %{})
  end
end
