defmodule Historifyapi.Router do
  use Historifyapi.Web, :router

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

#  scope "/", Historifyapi do
#    pipe_through :browser # Use the default browser stack
#
#    get "/", PageController, :index
#  end

  scope "/api", Historifyapi do
    pipe_through :api

    resources "/browser_link", BrowserLinkController

  end

  # Other scopes may use custom stacks.
  # scope "/api", Historifyapi do
  #   pipe_through :api
  # end
end
