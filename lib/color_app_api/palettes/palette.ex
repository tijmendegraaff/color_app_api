defmodule ColorAppApi.Palettes.Palette do
  use Ecto.Schema
  import Ecto.Changeset
  alias ColorAppApi.Accounts.User
  alias ColorAppApi.Palettes.Color

  schema "palettes" do
    field :name, :string
    field :emoji, :string

    belongs_to(:user, User)
    has_many(:colors, Color)

    timestamps()
  end

  @doc false
  def changeset(palette, attrs) do
    palette
    |> cast(attrs, [:name, :emoji, :user_id])
    |> validate_required([:name, :emoji, :user_id])
  end
end
