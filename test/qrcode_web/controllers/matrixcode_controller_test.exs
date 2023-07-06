defmodule QrcodeWeb.MatrixcodeControllerTest do
  use QrcodeWeb.ConnCase

  import Qrcode.MatrixcodesFixtures

  @create_attrs %{code: 42, description: "some description", status: "some status", type: "some type"}
  @update_attrs %{code: 43, description: "some updated description", status: "some updated status", type: "some updated type"}
  @invalid_attrs %{code: nil, description: nil, status: nil, type: nil}

  describe "index" do
    test "lists all matrixcodes", %{conn: conn} do
      conn = get(conn, Routes.matrixcode_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Matrixcodes"
    end
  end

  describe "new matrixcode" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.matrixcode_path(conn, :new))
      assert html_response(conn, 200) =~ "New Matrixcode"
    end
  end

  describe "create matrixcode" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.matrixcode_path(conn, :create), matrixcode: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.matrixcode_path(conn, :show, id)

      conn = get(conn, Routes.matrixcode_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Matrixcode"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.matrixcode_path(conn, :create), matrixcode: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Matrixcode"
    end
  end

  describe "edit matrixcode" do
    setup [:create_matrixcode]

    test "renders form for editing chosen matrixcode", %{conn: conn, matrixcode: matrixcode} do
      conn = get(conn, Routes.matrixcode_path(conn, :edit, matrixcode))
      assert html_response(conn, 200) =~ "Edit Matrixcode"
    end
  end

  describe "update matrixcode" do
    setup [:create_matrixcode]

    test "redirects when data is valid", %{conn: conn, matrixcode: matrixcode} do
      conn = put(conn, Routes.matrixcode_path(conn, :update, matrixcode), matrixcode: @update_attrs)
      assert redirected_to(conn) == Routes.matrixcode_path(conn, :show, matrixcode)

      conn = get(conn, Routes.matrixcode_path(conn, :show, matrixcode))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, matrixcode: matrixcode} do
      conn = put(conn, Routes.matrixcode_path(conn, :update, matrixcode), matrixcode: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Matrixcode"
    end
  end

  describe "delete matrixcode" do
    setup [:create_matrixcode]

    test "deletes chosen matrixcode", %{conn: conn, matrixcode: matrixcode} do
      conn = delete(conn, Routes.matrixcode_path(conn, :delete, matrixcode))
      assert redirected_to(conn) == Routes.matrixcode_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.matrixcode_path(conn, :show, matrixcode))
      end
    end
  end

  defp create_matrixcode(_) do
    matrixcode = matrixcode_fixture()
    %{matrixcode: matrixcode}
  end
end
