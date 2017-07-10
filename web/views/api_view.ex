defmodule ElmPhoenix.ApiView do
  use ElmPhoenix.Web, :view

  def render("index.json", %{data: data}) do
    data
  end
end
