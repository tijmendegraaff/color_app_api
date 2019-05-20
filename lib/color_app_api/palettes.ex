defmodule ColorAppApi.Palettes do
  @moduledoc """
  The Palettes context.
  """

  import Ecto.Query, warn: false
  alias ColorAppApi.Repo

  alias ColorAppApi.Palettes.{Palette, Color}

  @doc """
  Creates a palette.

  ## Examples

      iex> create_palette(%{field: value})
      {:ok, %Palette{}}

      iex> create_palette(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_color_palette(palette, colors_args) do
    {:ok, saved_palette} = create_palette(palette)
    saved_colors = Enum.map(colors_args, fn color -> create_color(color, saved_palette.id) end)
    saved_color_palette = Map.merge(saved_palette, %{colors: saved_colors})
    {:ok, saved_color_palette}
  end

  defp create_palette(args) do
    palette =
      %Palette{}
      |> Palette.changeset(args)
      |> Repo.insert()
  end

  defp create_color(colors, palette_id) do
    args = Map.merge(colors, %{palette_id: palette_id})

    {:ok, color} =
      %Color{}
      |> Color.changeset(args)
      |> Repo.insert()

    color
  end
end
