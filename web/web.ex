defmodule Leochats.Web do
  @moduledoc """
  A module that keeps using definitions for controllers,
  views and so on.

  This can be used in your application as:

      use Leochats.Web, :controller
      use Leochats.Web, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below.
  """

  def model do
    quote do
      use Ecto.Schema

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
    end
  end

  def controller do
    quote do
      use Phoenix.Controller

      alias Leochats.Repo
      import Ecto
      import Ecto.Query

      import Leochats.Router.Helpers
      import Leochats.Gettext
    end
  end

  def view do
    quote do
      use Phoenix.View,
      root: "lib/leochats_web/templates",
      namespace: LeoChats

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_csrf_token: 0, get_flash: 2, view_module: 1]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      import Leochats.Router.Helpers
      import Leochats.ErrorHelpers
      import Leochats.Gettext
      import Phoenix.LiveView, only: [live_render: 2, live_render: 3]
    end
  end

  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
      import Phoenix.Controller
      import Phoenix.LiveView.Router
    end


  end

  def channel do
    quote do
      use Phoenix.Channel

      alias Leochats.Repo
      import Ecto
      import Ecto.Query
      import Leochats.Gettext

    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
