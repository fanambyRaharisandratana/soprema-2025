defmodule Soprema.Pdf do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pdf" do
    field :nom, :string
    field :type, :string
  end

  def changeset(pdf, attrs) do
    pdf
    |> cast(attrs, [:nom, :type])
    |> validate_required([:nom, :type])
  end
end
