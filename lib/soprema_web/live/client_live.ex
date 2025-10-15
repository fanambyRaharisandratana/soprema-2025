defmodule SopremaWeb.ClientLive do
  use Phoenix.LiveView
  import Phoenix.HTML
  alias Soprema.Produits

  def mount(_params, _session, socket) do
    {:ok, assign(socket, page_title: "Liste des clients")}
  end

  def render(assigns) do
    ~H"""
    <div class="container-xxl py-5">
        <div class="container">
            <div class="tab-class text-center wow fadeInUp" data-wow-delay="0.1s">
                <ul class="nav nav-pills d-inline-flex justify-content-center border-bottom mb-5">
                    <li class="nav-item">
                        <a class="d-flex align-items-center text-start mx-3 ms-0 pb-3 active" data-bs-toggle="pill" href="#tab-1">

                            <div class="ps-3">
                                <h6 class="mt-n1 mb-0">Clients</h6>
                            </div>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="d-flex align-items-center text-start mx-3 pb-3" data-bs-toggle="pill" href="#tab-2">

                            <div class="ps-3">
                                <h6 class="mt-n1 mb-0">partenaire et fournisseur</h6>
                            </div>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="d-flex align-items-center text-start mx-3 me-0 pb-3" data-bs-toggle="pill" href="#tab-3">

                            <div class="ps-3">
                                <h6 class="mt-n1 mb-0">Promoteur immobiliere et ordre  des architectes</h6>
                            </div>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="d-flex align-items-center text-start mx-3 me-0 pb-3" data-bs-toggle="pill" href="#tab-4">

                            <div class="ps-3">
                                <h6 class="mt-n1 mb-0">Gros oeuvre</h6>
                            </div>
                        </a>
                    </li><li class="nav-item">
                        <a class="d-flex align-items-center text-start mx-3 me-0 pb-3" data-bs-toggle="pill" href="#tab-5">

                            <div class="ps-3">
                                <h6 class="mt-n1 mb-0">Bureau d'etude et de controle</h6>
                            </div>
                        </a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div id="tab-1" class="tab-pane fade show p-0 active">
                        <div class="row g-4">
                            <div class="col-lg-6">
                                <div class="d-flex align-items-center">
                                    <img class="flex-shrink-0 img-fluid rounded" src="img/menu-1.jpg" alt="" style="width: 80px;">
                                    <div class="w-100 d-flex flex-column text-start ps-4">
                                        <h5 class="d-flex justify-content-between border-bottom pb-2">
                                            <span>ENTREPRISE ETANCHE N.E</span>
                                            <span class="text-primary">034 15 611 89</span>
                                        </h5>
                                        <small class="fst-italic">Contact: noel.etancheite@gmail.com</small>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="d-flex align-items-center">
                                    <img class="flex-shrink-0 img-fluid rounded" src="img/menu-1.jpg" alt="" style="width: 80px;">
                                    <div class="w-100 d-flex flex-column text-start ps-4">
                                        <h5 class="d-flex justify-content-between border-bottom pb-2">
                                            <span>ENTREPRISE BENJAMIN</span>
                                            <span class="text-primary">034 03 001 40</span>
                                        </h5>
                                        <small class="fst-italic">Contact: e.benjaminandrianoelison@gmail.com</small>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="d-flex align-items-center">
                                    <img class="flex-shrink-0 img-fluid rounded" src="img/menu-1.jpg" alt="" style="width: 80px;">
                                    <div class="w-100 d-flex flex-column text-start ps-4">
                                        <h5 class="d-flex justify-content-between border-bottom pb-2">
                                            <span>ENTREPRISE AIDBAT TRADING</span>
                                            <span class="text-primary">034 07 401 00</span>
                                        </h5>
                                        <small class="fst-italic">Contact: michelmorizot@gmail.com</small>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="d-flex align-items-center">
                                    <img class="flex-shrink-0 img-fluid rounded" src="img/menu-1.jpg" alt="" style="width: 80px;">
                                    <div class="w-100 d-flex flex-column text-start ps-4">
                                        <h5 class="d-flex justify-content-between border-bottom pb-2">
                                            <span>TRAM EURL</span>
                                            <span class="text-primary"></span>
                                        </h5>
                                        <small class="fst-italic">Contact: jeanluc-andretseheno@trameurl.mg</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    """
  end
end
