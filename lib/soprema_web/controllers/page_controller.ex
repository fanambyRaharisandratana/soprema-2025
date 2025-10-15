defmodule SopremaWeb.PageController do
  use SopremaWeb, :controller
  alias Soprema.Produits

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    p = Produits.list_produit()
    render(conn, :home, produit_var: p, layout: false)
  end

  def client(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    p = Produits.list_produit()
    render(conn, :client, produit_var: p, layout: false)
  end

  def contact(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :contact, layout: false)
  end

  def produit(conn, %{"page" => page_param}) do
    # On parse la page depuis les params, par défaut 1 si absent ou invalide
    page =
      case Integer.parse(page_param || "1") do
        {n, _} when n > 0 -> n
        _ -> 1
      end

    page_size = 8  # tu peux ajuster le nombre de produits par page

    data = Produits.list_produit(page, page_size)

    type = Produits.caratype()
    carac = Produits.cara()

    render(conn, :produits,
      produit_var: data.produits,
      page: data.page,
      page_size: data.page_size,
      total_pages: data.total_pages,
      type: type,
      cara: carac,
      layout: false
    )
  end

# version sans paramètre : redirige vers page 1
def produit(conn, _params), do: produit(conn, %{"page" => "1"})

  def p_cara(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    p = Produits.list_produit()
    render(conn, :home, produit_var: p, layout: false)
  end

  def liste(conn,  %{"id" => id}) do
    page = nil
    p = Produits.p_cara(id)
    type = Produits.caratype()
    carac = Produits.cara()
    render(conn, :produits,  page: page, type: type,  cara: carac, produit_var: p, layout: false)
  end

  def recherche(conn, %{"find" => query}) do
    page = nil
    p = Produits.find(query)
    type = Produits.caratype()
    carac = Produits.cara()

    render(conn, :produits, page: page, type: type,  cara: carac,produit_var: p, layout: false)
  end
end
