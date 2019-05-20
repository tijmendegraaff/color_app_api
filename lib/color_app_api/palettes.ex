defmodule ColorAppApi.Palettes do
  @moduledoc """
  The Palettes context.
  """

  import Ecto.Query, warn: false
  alias ColorAppApi.Repo

  alias ColorAppApi.Palettes.Palette

  @doc """
  Creates a palette.

  ## Examples

      iex> create_palette(%{field: value})
      {:ok, %Palette{}}

      iex> create_palette(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_color_palette(attrs \\ %{}) do
    %Palette{}
    |> Palette.changeset(attrs)
    |> Repo.insert()
  end
end
