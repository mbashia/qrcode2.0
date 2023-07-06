defmodule Qrcode.MatrixcodesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Qrcode.Matrixcodes` context.
  """

  @doc """
  Generate a matrixcode.
  """
  def matrixcode_fixture(attrs \\ %{}) do
    {:ok, matrixcode} =
      attrs
      |> Enum.into(%{
        code: 42,
        description: "some description",
        status: "some status",
        type: "some type"
      })
      |> Qrcode.Matrixcodes.create_matrixcode()

    matrixcode
  end
end
