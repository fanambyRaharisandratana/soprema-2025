defmodule Soprema.Sousreference do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sousreferences" do
    field :idproduit, :integer
    field :codeproduit, :string
    field :impactcarbone, :string
    field :couleur, :string
    field :diametre, :string
    field :epaisseur, :string
    field :largeur, :string
    field :longueur, :string
    field :poids, :string
    field :volume, :string
    field :selection, :string
    field :conditionnement, :string
  end

  def changeset(sousreference, attrs) do
    sousreference
    |> cast(attrs, [ :idproduit,:codeproduit, :impactcarbone, :couleur, :diametre, :epaisseur, :largeur, :longueur, :poids, :volume, :selection, :conditionnement])
    |> validate_required([ :idproduit,:codeproduit, :impactcarbone, :couleur, :diametre, :epaisseur, :largeur, :longueur, :poids, :volume, :selection, :conditionnement])
  end
end
