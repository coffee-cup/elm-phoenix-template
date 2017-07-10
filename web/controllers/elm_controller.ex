defmodule ElmPhoenix.ElmController do
  use ElmPhoenix.Web, :controller

  def index(conn, _params) do
    conn
    |> render(ElmPhoenix.ElmView, "index.html")
  end
end
