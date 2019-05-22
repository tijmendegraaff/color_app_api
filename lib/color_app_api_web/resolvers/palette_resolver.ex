defmodule ColorAppApiWeb.Resolvers.PaletteResolver do
  alias ColorAppApi.Palettes

  def create_palette(_, %{input: input}, %{context: %{user: user}}) do
    colors = input.colors

    palette =
      Map.merge(input, %{user_id: user.id})
      |> Map.delete(:colors)

    Palettes.create_color_palette(palette, colors)
  end

  def delete_palette(_, %{palette_id: palette_id}, %{context: %{user: user}}) do
    palette = Palettes.get_palette!(palette_id)

    with palette.user_id === user.id do
      Palettes.delete_palette(palette)
    end
  end
end
