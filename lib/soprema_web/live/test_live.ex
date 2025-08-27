defmodule SopremaWeb.TestLive do
  # use SopremaWeb, :live_view
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :active_content, 0)}
  end

  # Événement
  def handle_event("to_doc", _params, socket) do
    IO.inspect("Clic reçu !", label: "DEBUG")
    {:noreply, assign(socket, :active_content, 1)}
  end

   def render(assigns) do
    ~H"""
    <div class="container p-5">
      <h2>Exemple phx-click</h2>

      <!-- Lien avec phx-click -->
      <a phx-click="to_doc"
         role="button"
         class="btn btn-primary">
        Document
      </a>

      <div class="mt-4">
        <%= if @active_content == 1 do %>
          <p>📄 Section Document affichée !</p>
        <% else %>
          <p>👉 Cliquez sur "Document" pour voir la section.</p>
        <% end %>
      </div>
    </div>
    """
  end

end
