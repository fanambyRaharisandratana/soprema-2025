defmodule SopremaWeb.PageController do
  use SopremaWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def produit(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :produits, layout: false)
  end
end
