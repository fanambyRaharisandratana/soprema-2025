defmodule Soprema.PageTest do
  use Soprema.DataCase

  alias Soprema.Page

  describe "dummies" do
    alias Soprema.Page.Dummy

    import Soprema.PageFixtures

    @invalid_attrs %{name: nil}

    test "list_dummies/0 returns all dummies" do
      dummy = dummy_fixture()
      assert Page.list_dummies() == [dummy]
    end

    test "get_dummy!/1 returns the dummy with given id" do
      dummy = dummy_fixture()
      assert Page.get_dummy!(dummy.id) == dummy
    end

    test "create_dummy/1 with valid data creates a dummy" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Dummy{} = dummy} = Page.create_dummy(valid_attrs)
      assert dummy.name == "some name"
    end

    test "create_dummy/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Page.create_dummy(@invalid_attrs)
    end

    test "update_dummy/2 with valid data updates the dummy" do
      dummy = dummy_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Dummy{} = dummy} = Page.update_dummy(dummy, update_attrs)
      assert dummy.name == "some updated name"
    end

    test "update_dummy/2 with invalid data returns error changeset" do
      dummy = dummy_fixture()
      assert {:error, %Ecto.Changeset{}} = Page.update_dummy(dummy, @invalid_attrs)
      assert dummy == Page.get_dummy!(dummy.id)
    end

    test "delete_dummy/1 deletes the dummy" do
      dummy = dummy_fixture()
      assert {:ok, %Dummy{}} = Page.delete_dummy(dummy)
      assert_raise Ecto.NoResultsError, fn -> Page.get_dummy!(dummy.id) end
    end

    test "change_dummy/1 returns a dummy changeset" do
      dummy = dummy_fixture()
      assert %Ecto.Changeset{} = Page.change_dummy(dummy)
    end
  end
end
