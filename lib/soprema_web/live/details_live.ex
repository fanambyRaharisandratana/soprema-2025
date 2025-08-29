defmodule SopremaWeb.DetailsLive do
  use Phoenix.LiveView
  # use SopremaWeb, :live_view
  import Phoenix.HTML
  alias Soprema.Produits

  @impl true
  def mount(%{"id" => id}, _session, socket) do
    content = function_doc()
    produit = Produits.detail(id)
    pr = List.first(produit)
    car = Produits.caracteristiques(id)
    {:ok, assign(socket, content: raw(content), produitcar: car, produit: produit, pr: pr, active_content: 1)}
  end

  def render(assigns) do
    ~H"""
    <div class="container mb-5 mt-5">
        <div class="row">

          <!-- Colonne gauche : Carousel -->
          <div class="col-md-3">
            <!-- <nav aria-label="breadcrumb">
                <ol class="breadcrumb justify-content-center text-uppercase">
                    <li class="breadcrumb-item"><a href="#">Accueil</a></li>
                    <li class="breadcrumb-item"><a href="#">Produits</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Menu</li>
                </ol>
            </nav> -->
            <div id="testimonialCarousel" class="carousel slide" data-bs-ride="carousel">
              <div class="carousel-inner">

                <!-- Item 1 -->
                <%= for {p, index} <- Enum.with_index(@produit) do %>
                  <div class={"carousel-item #{if index == 0, do: "active"}"}>
                    <div class="testimonial-item d-flex align-items-center text-white p-5" style="height: 300px; position: relative;">
                      <img src={"/" <> p.photo}
                          alt={"Image du produit #{p.id}"}
                          class="w-100 h-100 object-cover rounded"
                          style="object-fit: cover;"/>
                      <div style="position: absolute; inset: 0;"></div>
                    </div>
                  </div>
                <% end %>

              </div>

              <!-- Indicators -->
              <div class="carousel-indicators">
                <%= for {p, index} <- Enum.with_index(@produit) do %>
                  <button type="button"
                          data-bs-target="#testimonialCarousel"
                          data-bs-slide-to={index}
                          class={ if index == 0, do: "active"}
                          style="background-color: #0072ce;">
                  </button>
                <% end %>
              </div>

              <!-- Boutons de navigation -->
              <button class="carousel-control-prev" type="button" data-bs-target="#testimonialCarousel" data-bs-slide="prev"
                style="left: 0.5rem; width: 35px; height: 35px; background: #fff; border-radius: 50%; transform: translateY(350%);">
                <i class="fas fa-chevron-left text-dark"></i>
                <span class="visually-hidden">Previous</span>
              </button>

              <button class="carousel-control-next" type="button" data-bs-target="#testimonialCarousel" data-bs-slide="next"
                style="right: 0.5rem; width: 35px; height: 35px; background: #fff; border-radius: 50%; transform: translateY(350%);">
                <i class="fas fa-chevron-right text-dark"></i>
                <span class="visually-hidden">Next</span>
              </button>
            </div>
          </div>

          <!-- Colonne droite : Texte -->
          <div class="col-md-9 justify-content-start">
            <h2 class="mb-4"><%= @pr.nom %></h2>
             <!-- Menu horizontal -->
              <ul class="nav nav-pills d-inline-flex justify-content-start border-bottom mb-2">
                <li class="nav-item">
                    <a class="d-flex align-items-center text-start mx-3 pb-3" data-bs-toggle="pill"
                    phx-click="to_doc" href="#tab-3" role="button">
                        <div class="ps-3">
                            <h6 class="mt-n1 mb-0">Document</h6>
                        </div>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="d-flex align-items-center text-start mx-3 pb-3 border-0 bg-transparent w-100"
                        data-bs-toggle="pill" href="#tab-3" phx-click="to_cara" phx-value-id={@pr.id}>
                      <div class="ps-3">
                          <h6 class="mt-n1 mb-0">Caractéristiques</h6>
                      </div>
                  </a>
                </li>
                <li class="nav-item">
                    <a class="d-flex align-items-center text-start mx-3 me-0 pb-3" phx-click="to_desc" phx-value-id={@pr.id} data-bs-toggle="pill" href="#tab-3">
                        <div class="ps-3">
                            <h6 class="mt-n1 mb-0">Description</h6>
                        </div>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="d-flex align-items-center text-start mx-3 me-0 pb-3" phx-click="to_ava" phx-value-id={@pr.id} data-bs-toggle="pill" href="#tab-3">
                        <div class="ps-3">
                            <h6 class="mt-n1 mb-0">Avantages</h6>
                        </div>
                    </a>
                </li>
            </ul>
            <div class="container">

              <%= @content %>

            </div>
          </div>

        </div>
    </div>

    """
  end

  defp function_doc() do
    """
    <div class="row">
      <!-- Colonne 1 -->
        <div class="col-md-6">
          <h4 class="mb-3">Fiche technique</h4>
          <ul class="list-group">
            <li class="list-group-item d-flex justify-content-between align-items-center">
              Guide d’installation
              <a href="/pdfs/guide-installation.pdf" class="btn btn-sm btn-primary" download>
                Télécharger
              </a>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center">
              Catalogue Produits
              <a href="/pdfs/guide-installation.pdf" class="btn btn-sm btn-primary" download>
                Télécharger
              </a>
            </li>
          </ul>
        </div>

        <!-- Colonne 2 -->
        <div class="col-md-6">
          <h4 class="mb-3">Fiche de données de sécurité</h4>
          <ul class="list-group">
            <li class="list-group-item d-flex justify-content-between align-items-center">
              Guide d’installation
              <a href="/pdfs/guide-installation.pdf" class="btn btn-sm btn-primary" download>
                Télécharger
              </a>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center">
              Catalogue Produits
              <a href="/pdfs/catalogue-produits.pdf" class="btn btn-sm btn-primary" download>
                Télécharger
              </a>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center">
              Fiche Technique
              <a href="/pdfs/fiche-technique.pdf" class="btn btn-sm btn-primary" download>
                Télécharger
              </a>
            </li>
          </ul>
        </div>

        <!-- Colonne 3 -->
        <div class="col-md-6">
          <h4 class="mb-3">cahier de prescription de pose</h4>
          <ul class="list-group">
            <li class="list-group-item d-flex justify-content-between align-items-center">
              Guide d’installation
              <a href="/pdfs/guide-installation.pdf" class="btn btn-sm btn-primary" download>
                Télécharger
              </a>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center">
              Catalogue Produits
              <a href="/pdfs/catalogue-produits.pdf" class="btn btn-sm btn-primary" download>
                Télécharger
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
    """
  end

  def function_cara(produits) do
    Enum.map_join(produits, "", fn produit ->
      """
      <div class="row">
        <ul class="list-group">
          #{Enum.map_join(List.wrap(produit.caracteristique), "", fn carac ->
          "<li class='list-group-item'>#{carac}</li>"
          end)}
        </ul>
      </div>
      """
    end)
  end

  def function_ava(produits) do
    Enum.map_join(produits, "", fn produit ->
      """
      <div class="row">
        <ul class="list-group">
          #{Enum.map_join(List.wrap(produit.avantage), "", fn carac ->
          "<li class='list-group-item'>#{carac}</li>"
          end)}
        </ul>
      </div>
      """
    end)
  end

  def function_desc(produits) do
    produit = Produits.detail(produits)
    pr = List.first(produit)
      """
      <div class="container">
        <p>#{pr.description}</p>
      </div>
      """
  end

  def handle_event("to_doc", socket) do
  second_card_html = function_doc()
    {:noreply, assign(socket, content: raw(second_card_html))}
  end

  def handle_event("to_cara", %{"id" => id}, socket) do
    produit = Produits.caracteristiques(id)
    second_card_html = function_cara(produit)
    {:noreply, assign(socket, content: raw(second_card_html))}
  end

  def handle_event("to_ava", %{"id" => id}, socket) do
    produit = Produits.avantages(id)
    second_card_html = function_ava(produit)
    {:noreply, assign(socket, content: raw(second_card_html))}
  end

  def handle_event("to_desc", %{"id" => id}, socket) do
    second_card_html = function_desc(id)
    {:noreply, assign(socket, content: raw(second_card_html))}
  end


end
