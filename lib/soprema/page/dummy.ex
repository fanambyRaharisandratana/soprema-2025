defmodule Soprema.Page.Dummy do
  use Ecto.Schema
  import Ecto.Changeset

  schema "dummies" do
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(dummy, attrs) do
    dummy
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
