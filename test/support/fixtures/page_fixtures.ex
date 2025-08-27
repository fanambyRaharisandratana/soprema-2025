defmodule Soprema.PageFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Soprema.Page` context.
  """

  @doc """
  Generate a dummy.
  """
  def dummy_fixture(attrs \\ %{}) do
    {:ok, dummy} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Soprema.Page.create_dummy()

    dummy
  end
end
