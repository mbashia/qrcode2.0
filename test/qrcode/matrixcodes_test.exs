defmodule Qrcode.MatrixcodesTest do
  use Qrcode.DataCase

  alias Qrcode.Matrixcodes

  describe "matrixcodes" do
    alias Qrcode.Matrixcodes.Matrixcode

    import Qrcode.MatrixcodesFixtures

    @invalid_attrs %{code: nil, description: nil, status: nil, type: nil}

    test "list_matrixcodes/0 returns all matrixcodes" do
      matrixcode = matrixcode_fixture()
      assert Matrixcodes.list_matrixcodes() == [matrixcode]
    end

    test "get_matrixcode!/1 returns the matrixcode with given id" do
      matrixcode = matrixcode_fixture()
      assert Matrixcodes.get_matrixcode!(matrixcode.id) == matrixcode
    end

    test "create_matrixcode/1 with valid data creates a matrixcode" do
      valid_attrs = %{code: 42, description: "some description", status: "some status", type: "some type"}

      assert {:ok, %Matrixcode{} = matrixcode} = Matrixcodes.create_matrixcode(valid_attrs)
      assert matrixcode.code == 42
      assert matrixcode.description == "some description"
      assert matrixcode.status == "some status"
      assert matrixcode.type == "some type"
    end

    test "create_matrixcode/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Matrixcodes.create_matrixcode(@invalid_attrs)
    end

    test "update_matrixcode/2 with valid data updates the matrixcode" do
      matrixcode = matrixcode_fixture()
      update_attrs = %{code: 43, description: "some updated description", status: "some updated status", type: "some updated type"}

      assert {:ok, %Matrixcode{} = matrixcode} = Matrixcodes.update_matrixcode(matrixcode, update_attrs)
      assert matrixcode.code == 43
      assert matrixcode.description == "some updated description"
      assert matrixcode.status == "some updated status"
      assert matrixcode.type == "some updated type"
    end

    test "update_matrixcode/2 with invalid data returns error changeset" do
      matrixcode = matrixcode_fixture()
      assert {:error, %Ecto.Changeset{}} = Matrixcodes.update_matrixcode(matrixcode, @invalid_attrs)
      assert matrixcode == Matrixcodes.get_matrixcode!(matrixcode.id)
    end

    test "delete_matrixcode/1 deletes the matrixcode" do
      matrixcode = matrixcode_fixture()
      assert {:ok, %Matrixcode{}} = Matrixcodes.delete_matrixcode(matrixcode)
      assert_raise Ecto.NoResultsError, fn -> Matrixcodes.get_matrixcode!(matrixcode.id) end
    end

    test "change_matrixcode/1 returns a matrixcode changeset" do
      matrixcode = matrixcode_fixture()
      assert %Ecto.Changeset{} = Matrixcodes.change_matrixcode(matrixcode)
    end
  end
end
