defmodule Soprema.Caracteristique do
  use Ecto.Schema
  import Ecto.Changeset

  schema "caracteristique" do
    field :nom, :string
    field :type, :string
  end

  def changeset(caracteristique, attrs) do
    caracteristique
    |> cast(attrs, [:nom, :type])
    |> validate_required([:nom, :type])
  end
end
