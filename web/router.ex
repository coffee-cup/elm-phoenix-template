defmodule ElmPhoenix.Router do
  use ElmPhoenix.Web, :router

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

  scope "/api", ElmPhoenix do
    pipe_through :api

    get "/", ApiController, :index
  end

  scope "/", ElmPhoenix do
    pipe_through :browser # Use the default browser stack

    get "/*path", ElmController, :index
  end
end
