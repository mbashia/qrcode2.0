defmodule Qrcode.Matrixcodes do
  @moduledoc """
  The Matrixcodes context.
  """

  import Ecto.Query, warn: false
  alias Qrcode.Repo

  alias Qrcode.Matrixcodes.Matrixcode

  @doc """
  Returns the list of matrixcodes.

  ## Examples

      iex> list_matrixcodes()
      [%Matrixcode{}, ...]

  """
  def list_matrixcodes do
    Repo.all(Matrixcode)
  end

  @doc """
  Gets a single matrixcode.

  Raises `Ecto.NoResultsError` if the Matrixcode does not exist.

  ## Examples

      iex> get_matrixcode!(123)
      %Matrixcode{}

      iex> get_matrixcode!(456)
      ** (Ecto.NoResultsError)

  """
  def get_matrixcode!(id), do: Repo.get!(Matrixcode, id)

  @doc """
  Creates a matrixcode.

  ## Examples

      iex> create_matrixcode(%{field: value})
      {:ok, %Matrixcode{}}

      iex> create_matrixcode(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_matrixcode(attrs \\ %{}) do
    %Matrixcode{}
    |> Matrixcode.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a matrixcode.

  ## Examples

      iex> update_matrixcode(matrixcode, %{field: new_value})
      {:ok, %Matrixcode{}}

      iex> update_matrixcode(matrixcode, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_matrixcode(%Matrixcode{} = matrixcode, attrs) do
    matrixcode
    |> Matrixcode.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a matrixcode.

  ## Examples

      iex> delete_matrixcode(matrixcode)
      {:ok, %Matrixcode{}}

      iex> delete_matrixcode(matrixcode)
      {:error, %Ecto.Changeset{}}

  """
  def delete_matrixcode(%Matrixcode{} = matrixcode) do
    Repo.delete(matrixcode)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking matrixcode changes.

  ## Examples

      iex> change_matrixcode(matrixcode)
      %Ecto.Changeset{data: %Matrixcode{}}

  """
  def change_matrixcode(%Matrixcode{} = matrixcode, attrs \\ %{}) do
    Matrixcode.changeset(matrixcode, attrs)
  end
end
