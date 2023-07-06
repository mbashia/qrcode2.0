defmodule QrcodeWeb.MatrixcodeController do
  use QrcodeWeb, :controller

  alias Qrcode.Matrixcodes
  alias Qrcode.Matrixcodes.Matrixcode

  def index(conn, _params) do
    matrixcodes = Matrixcodes.list_matrixcodes()
    render(conn, "index.html", matrixcodes: matrixcodes)
  end

  def new(conn, _params) do
    changeset = Matrixcodes.change_matrixcode(%Matrixcode{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"matrixcode" => matrixcode_params}) do
    case Matrixcodes.create_matrixcode(matrixcode_params) do
      {:ok, matrixcode} ->
        conn
        |> put_flash(:info, "Matrixcode created successfully.")
        |> redirect(to: Routes.matrixcode_path(conn, :show, matrixcode))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    matrixcode = Matrixcodes.get_matrixcode!(id)
    render(conn, "show.html", matrixcode: matrixcode)
  end

  def edit(conn, %{"id" => id}) do
    matrixcode = Matrixcodes.get_matrixcode!(id)
    changeset = Matrixcodes.change_matrixcode(matrixcode)
    render(conn, "edit.html", matrixcode: matrixcode, changeset: changeset)
  end

  def update(conn, %{"id" => id, "matrixcode" => matrixcode_params}) do
    matrixcode = Matrixcodes.get_matrixcode!(id)

    case Matrixcodes.update_matrixcode(matrixcode, matrixcode_params) do
      {:ok, matrixcode} ->
        conn
        |> put_flash(:info, "Matrixcode updated successfully.")
        |> redirect(to: Routes.matrixcode_path(conn, :show, matrixcode))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", matrixcode: matrixcode, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    matrixcode = Matrixcodes.get_matrixcode!(id)
    {:ok, _matrixcode} = Matrixcodes.delete_matrixcode(matrixcode)

    conn
    |> put_flash(:info, "Matrixcode deleted successfully.")
    |> redirect(to: Routes.matrixcode_path(conn, :index))
  end
end
