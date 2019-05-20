defmodule ColorAppApiWeb.Schema.Types.PaletteType do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: ColorAppApi.Repo

  object :palette_type do
    field(:id, :id)
    field(:name, :string)
    field(:emoji, :string)
    field :colors, list_of(:color_type), resolve: assoc(:colors)
  end

  input_object :palette_input_type do
    field(:name, non_null(:string))
    field(:emoji, non_null(:string))
    field(:colors, non_null(list_of(:color_input_type)))
  end
end
