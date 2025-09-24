defmodule Soprema.ProduitComplementaire do
  use Ecto.Schema
  import Ecto.Changeset

  schema "produit_complementaires" do
    field :idproduit, :integer
    field :idproduitcomp, :integer
    field :nom, :string
    field :photo, :string
  end

  def changeset(produitcomp, attrs) do
    produitcomp
    |> cast(attrs, [:nom, :photo, :idproduit, :idproduitcomp])
    |> validate_required([:nom, :photo, :idproduit, :idproduitcomp])
  end
end
