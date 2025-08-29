defmodule Soprema.Avantage do
  use Ecto.Schema
  import Ecto.Changeset

  schema "avantage" do
    field :nom, :string
  end

  def changeset(l_produit, attrs) do
    l_produit
    |> cast(attrs, [:nom])
    |> validate_required([:nom])
  end
end
