defmodule ColorAppApi.Repo.Migrations.CreatePalettes do
  use Ecto.Migration

  def change do
    create table(:palettes) do
      add :name, :string
      add :emoji, :text
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end
  end
end
