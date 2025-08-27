defmodule SopremaWeb.DummyLive.FormComponent do
  use SopremaWeb, :live_component

  alias Soprema.Page

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        {@title}
        <:subtitle>Use this form to manage dummy records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="dummy-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:name]} type="text" label="Name" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Dummy</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{dummy: dummy} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Page.change_dummy(dummy))
     end)}
  end

  @impl true
  def handle_event("validate", %{"dummy" => dummy_params}, socket) do
    changeset = Page.change_dummy(socket.assigns.dummy, dummy_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"dummy" => dummy_params}, socket) do
    save_dummy(socket, socket.assigns.action, dummy_params)
  end

  defp save_dummy(socket, :edit, dummy_params) do
    case Page.update_dummy(socket.assigns.dummy, dummy_params) do
      {:ok, dummy} ->
        notify_parent({:saved, dummy})

        {:noreply,
         socket
         |> put_flash(:info, "Dummy updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_dummy(socket, :new, dummy_params) do
    case Page.create_dummy(dummy_params) do
      {:ok, dummy} ->
        notify_parent({:saved, dummy})

        {:noreply,
         socket
         |> put_flash(:info, "Dummy created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
