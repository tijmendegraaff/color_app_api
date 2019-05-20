defmodule ColorAppApi.Palettes.Palette do
  use Ecto.Schema
  import Ecto.Changeset
  alias ColorAppApi.Accounts.User

  schema "palettes" do
    field :name, :string
    field :emoji, :string

    belongs_to(:user, User)

    timestamps()
  end

  @doc false
  def changeset(palette, attrs) do
    palette
    |> cast(attrs, [:name, :emoji, :user_id])
    |> validate_required([:name, :emoji, :user_id])
  end
end
