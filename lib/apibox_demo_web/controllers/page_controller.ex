defmodule ApiboxDemoWeb.PageController do
  use ApiboxDemoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
