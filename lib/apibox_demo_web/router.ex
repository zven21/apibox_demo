defmodule ApiboxDemoWeb.Router do
  use ApiboxDemoWeb, :router

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

  scope "/", ApiboxDemoWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/posts", PostController
    resources "/books", BookController
  end

  # Other scopes may use custom stacks.
  # scope "/api", ApiboxDemoWeb do
  #   pipe_through :api
  # end
end
