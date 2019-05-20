defmodule ColorAppApiWeb.Resolvers.PaletteResolver do
  alias ColorAppApi.Accounts
  alias ColorAppApi.Palettes

  def create_palette(_, %{input: input}, %{context: %{user: user}}) do
    colors = input.colors

    palette =
      Map.merge(input, %{user_id: user.id})
      |> Map.delete(:colors)

    Palettes.create_color_palette(palette, colors)
  end
end
