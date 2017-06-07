defmodule HammerTestbed.Web.Router do
  use HammerTestbed.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HammerTestbed.Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/timestamp", PageController, :get_timestamp
  end

  # Other scopes may use custom stacks.
  # scope "/api", HammerTestbed.Web do
  #   pipe_through :api
  # end
end
