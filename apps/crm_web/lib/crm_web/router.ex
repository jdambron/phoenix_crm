defmodule CrmWeb.Router do
  use CrmWeb, :router

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

  scope "/", CrmWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/contacts", ContactController, only: [:index, :show, :new, :create, :delete]
    resources "/updates", UpdateController, only: [:new, :create]
    resources "/groups", GroupController, only: [:index, :new, :create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", CrmWeb do
  #   pipe_through :api
  # end
end
