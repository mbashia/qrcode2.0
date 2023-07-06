defmodule Qrcode.Repo.Migrations.CreateMatrixcodes do
  use Ecto.Migration

  def change do
    create table(:matrixcodes) do
      add :type, :string
      add :description, :text
      add :code, :integer
      add :status, :string
      add :picture, :string

      timestamps()
    end
  end
end
