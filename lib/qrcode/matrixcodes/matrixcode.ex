defmodule Qrcode.Matrixcodes.Matrixcode do
  use Ecto.Schema
  import Ecto.Changeset
  use  Waffle.Ecto.Schema

  schema "matrixcodes" do
    field :code, :integer
    field :description, :string
    field :status, :string
    field :type, :string
    field :picture, Qrcode.QrcodeImage.Type

    timestamps()
  end

  @doc false
  def changeset(matrixcode, attrs) do
    matrixcode
    |> cast(attrs, [:type, :description, :code, :status, :picture])
    |> validate_required([:type, :description, :code, :status, :picture])
  end
end
