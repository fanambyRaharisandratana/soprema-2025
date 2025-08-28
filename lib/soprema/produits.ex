defmodule Soprema.Produits do
  alias Soprema.{Repo,Produit}
  alias Soprema.Photo
  import Ecto.Query

  def list_produit do
    query = from p in Photo,
        join: c in Produit, on: p.idproduit == c.id,
        group_by: [c.id, c.nom, c.description, p.idproduit, p.nom],
        select: %{
          id: c.id,
          idcircuit: p.idproduit,
          nom: c.nom,
          photo: p.nom,
          description: c.description
        }
    Repo.all(query)
  end

  def detail(id) do
    query = from p in Photo,
        join: c in Produit, on: p.idproduit == c.id,
        group_by: [c.id, c.nom, c.description, p.idproduit, p.nom],
        where: c.id == ^id,
        select: %{
          id: c.id,
          idcircuit: p.idproduit,
          nom: c.nom,
          photo: p.nom,
          description: c.description
        }
    Repo.all(query)
  end

  def find(nom_produit) do
    query =
      from p in Photo,
        join: c in Produit, on: p.idproduit == c.id,
        where: ilike(c.nom, ^"%#{nom_produit}%"),
        distinct: c.id,
        order_by: [c.id, p.id],
        select: %{
          id: c.id,
          idcircuit: p.idproduit,
          nom: c.nom,
          photo: p.nom,
          description: c.description
      }

    Repo.all(query)
  end
end
