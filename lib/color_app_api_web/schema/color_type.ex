defmodule ColorAppApiWeb.Schema.Types.ColorType do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: ColorAppApi.Repo

  object :color_type do
    field(:id, :id)
    field(:name, :string)
    field(:color_code, :string)
  end

  input_object :color_input_type do
    field(:name, :string)
    field(:color_code, :string)
  end
end
