defmodule Soprema.Produits do
  alias Soprema.{Repo,Produit}
  alias Soprema.Photo
  alias Soprema.L_produit
  alias Soprema.Caracteristique
  alias Soprema.Avantage
  import Ecto.Query

  def list_produit(page \\ 1, page_size \\ 8) do
  query =
    from p0 in Soprema.Photo,
      join: p1 in Soprema.Produit, on: p0.idproduit == p1.id,
      select: %{
        id: p1.id,
        idcircuit: p0.idproduit,
        nom: p1.nom,
        photo: fragment("MIN(?)", p0.nom),
        description: p1.description
      },
      group_by: [p1.id, p1.nom, p1.description, p0.idproduit],
      order_by: [asc: p1.id],
      limit: ^page_size,
      offset: ^((page - 1) * page_size)

  Repo.all(query)
end

  # def list_produit do
  #   query = from p in Photo,
  #       join: c in Produit, on: p.idproduit == c.id,
  #       group_by: [c.id, c.nom, c.description, p.idproduit, p.nom],
  #       select: %{
  #         id: c.id,
  #         idcircuit: p.idproduit,
  #         nom: c.nom,
  #         photo: p.nom,
  #         description: c.description
  #       }
  #   Repo.all(query)
  # end

  def caratype do
    from(p in Caracteristique,
      select: %{nom: p.type},
      distinct: true
    )
    |> Repo.all()
  end

  def cara do
    from(p in Caracteristique,
      select: %{id: p.id, type: p.type, nom: p.nom}
    )
    |> Repo.all()
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

  def caracteristiques(id) do
    query = from l in L_produit,
        join: p in Produit, on: l.idproduit == p.id,
        join: c in Caracteristique, on: c.id == l.idcaracteristique,
        where: p.id == ^id,
        select: %{
          id: p.id,
          nom: c.nom,
          description: p.description,
          caracteristique: c.nom
        }
    Repo.all(query)
  end

  def p_cara(id) do
    query = from l in L_produit,
        join: p in Produit, on: l.idproduit == p.id,
        join: c in Caracteristique, on: c.id == l.idcaracteristique,
        join: ph in Photo, on: ph.id == l.idphoto,
        where: c.id == ^id,
        select: %{
          id: p.id,
          nom: c.nom,
          description: p.description,
          caracteristique: c.nom,
          photo: ph.nom
        }
    Repo.all(query)
  end

  def avantages(id) do
    query = from l in L_produit,
      join: p in Produit, on: l.idproduit == p.id,
      join: a in Avantage, on: a.id == l.idavantage,
      where: p.id == ^id,
      select: %{
        id: p.id,
        description: p.description,
        avantage: a.nom
      }
    Repo.all(query)
  end

  def detailone(id) do
    query =
      from p in Photo,
        join: c in Produit, on: p.idproduit == c.id,
        where: c.id == ^id,
        distinct: c.id,
        order_by: [c.id, p.id],
        select: %{
          id: c.id,
          idproduit: p.idproduit,
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
