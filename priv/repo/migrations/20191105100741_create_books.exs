defmodule ApiboxDemo.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :desc, :string
      add :price, :integer

      timestamps()
    end
  end
end
