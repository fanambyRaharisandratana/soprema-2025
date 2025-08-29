defmodule Soprema.L_produit do
  use Ecto.Schema
  import Ecto.Changeset

  schema "l_produit" do
    field :nom, :string
    field :description, :string
    field :photo, :string
    field :caracteristique, :string
    field :avantage, :string
  end

  def changeset(l_produit, attrs) do
    l_produit
    |> cast(attrs, [:nom, :description, :photo, :caracteristique, :avantage])
    |> validate_required([:nom, :description, :photo, :caracteristique, :avantage])
  end
end
