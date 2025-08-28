defmodule SopremaWeb.DetailsLive do
  use Phoenix.LiveView
  # use SopremaWeb, :live_view
  import Phoenix.HTML
  alias Soprema.Produits

  @impl true
  def mount(%{"id" => id}, _session, socket) do
    content = function_doc()
    {:ok, assign(socket, content: raw(content), active_content: 1)}
  end

  def render(assigns) do
    ~H"""
    <div class="container mb-5 mt-5">
        <div class="row">

          <!-- Colonne gauche : Carousel -->
          <div class="col-md-3">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb justify-content-center text-uppercase">
                    <li class="breadcrumb-item"><a href="#">Accueil</a></li>
                    <li class="breadcrumb-item"><a href="#">Produits</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Menu</li>
                </ol>
            </nav>
            <div id="testimonialCarousel" class="carousel slide" data-bs-ride="carousel">
              <div class="carousel-inner">

                <!-- Item 1 -->
                <div class="carousel-item active">
                  <div class="testimonial-item d-flex align-items-center text-white p-5"
                    style="background: url('images/p-1.webp') center center / cover no-repeat; height: 300px; position: relative;">
                    <div style="position: absolute; inset: 0;"></div>
                  </div>
                </div>

                <!-- Item 2 -->
                <div class="carousel-item">
                  <div class="testimonial-item d-flex align-items-center text-white p-5"
                    style="background: url('images/p-2.webp') center center / cover no-repeat; height: 300px; position: relative;">
                    <div style="position: absolute; inset: 0;"></div>
                  </div>
                </div>

                <!-- Item 3 -->
                <div class="carousel-item">
                  <div class="testimonial-item d-flex align-items-center text-white p-5"
                    style="background: url('images/p-3.webp') center center / cover no-repeat; height: 300px; position: relative;">
                    <div style="position: absolute; inset: 0;"></div>
                  </div>
                </div>

              </div>

              <!-- Indicators -->
              <div class="carousel-indicators">
                <button style="background-color: #0072ce;" type="button" data-bs-target="#testimonialCarousel" data-bs-slide-to="0" class="active"></button>
                <button style="background-color: #0072ce;" type="button" data-bs-target="#testimonialCarousel" data-bs-slide-to="1"></button>
                <button style="background-color: #0072ce;" type="button" data-bs-target="#testimonialCarousel" data-bs-slide-to="2"></button>
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
            <h2 class="mb-4">Elastovap</h2>
             <!-- Menu horizontal -->
              <ul class="nav nav-pills d-inline-flex justify-content-start border-bottom mb-2">
                <li class="nav-item">
                    <a class="d-flex align-items-center text-start mx-3 pb-3" data-bs-toggle="pill"
                    phx-click="to_doc" role="button">
                        <div class="ps-3">
                            <h6 class="mt-n1 mb-0">Document</h6>
                        </div>
                    </a>
                </li>
                <li class="nav-item">
                    <a type="button" data-bs-toggle="pill"
                          class="d-flex align-items-center text-start mx-3 pb-3 border-0 bg-transparent w-100"
                          phx-click="to_desc">
                      <div class="ps-3">
                          <h6 class="mt-n1 mb-0">Caractéristiques</h6>
                      </div>
                  </a>
                </li>
                <li class="nav-item">
                    <a class="d-flex align-items-center text-start mx-3 me-0 pb-3" data-bs-toggle="pill" href="#tab-3">
                        <div class="ps-3">
                            <h6 class="mt-n1 mb-0">Avantages</h6>
                        </div>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="d-flex align-items-center text-start mx-3 me-0 pb-3" data-bs-toggle="pill" href="#tab-3">
                        <div class="ps-3">
                            <h6 class="mt-n1 mb-0">Sous-références</h6>
                        </div>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="d-flex align-items-center text-start mx-3 me-0 pb-3" data-bs-toggle="pill" href="#tab-3">
                        <div class="ps-3">
                            <h6 class="mt-n1 mb-0">Produits complémentaires</h6>
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

  def function_desc() do
    """
      <div class="row">
        <p>description</p>
      </div>
    """
  end

  def handle_event("to_doc", socket) do
  second_card_html = function_doc()
    {:noreply, assign(socket, content: raw(second_card_html))}
  end

  def handle_event("to_desc", _params, socket) do
  second_card_html = function_desc()
    {:noreply, assign(socket, content: raw(second_card_html))}
  end


end
