defmodule ColorAppApi.Repo.Migrations.CreateColors do
  use Ecto.Migration

  def change do
    create table(:colors) do
      add :name, :string
      add :color_code, :string
      add :palette_id, references(:palettes, on_delete: :delete_all)

      timestamps()
    end
  end
end
