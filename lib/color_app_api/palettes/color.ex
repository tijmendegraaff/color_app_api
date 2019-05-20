defmodule ColorAppApi.Palettes.Color do
  use Ecto.Schema
  import Ecto.Changeset
  alias ColorAppApi.Palettes.Palette

  schema "colors" do
    field :name, :string
    field :color_code, :string

    belongs_to(:palette, Palette)

    timestamps()
  end

  @doc false
  def changeset(color, attrs) do
    color
    |> cast(attrs, [:name, :color_code, :palette_id])
    |> validate_required([:name, :color_code, :palette_id])
  end
end
