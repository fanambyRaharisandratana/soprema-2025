defmodule Soprema.Repo.Migrations.CreateDummies do
  use Ecto.Migration

  def change do
    create table(:dummies) do
      add :name, :string

      timestamps(type: :utc_datetime)
    end
  end
end
