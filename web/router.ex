defmodule Leochats.Router do
  use Leochats.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Phoenix.LiveView.Flash
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Leochats do
    pipe_through :browser # Use the default browser stack

    get "/", ChatController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Leochats do
  #   pipe_through :api
  # end
end
