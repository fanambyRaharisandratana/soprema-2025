defmodule Soprema.Produit do
  use Ecto.Schema
  import Ecto.Changeset

  schema "produit" do
    field :idproduit, :integer
    field :nom, :string
    field :description, :string
    field :photo, :string
  end

  def changeset(produit, attrs) do
    produit
    |> cast(attrs, [:idproduit ,:nom, :description, :photo])
    |> validate_required([:idproduit ,:nom, :description, :photo])
  end

  def count_produit do
    Repo.aggregate(Produit, :count, :id)
  end
end
