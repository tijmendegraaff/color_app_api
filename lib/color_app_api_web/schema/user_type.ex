defmodule ColorAppApiWeb.Schema.Types.UserType do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: ColorAppApi.Repo

  object :user_type do
    field(:id, :id)
    field(:first_name, :string)
    field(:last_name, :string)
    field(:email, :string)
    field :palettes, list_of(:palette_type), resolve: assoc(:palettes)
  end

  input_object :user_input_type do
    field(:first_name, non_null(:string))
    field(:last_name, non_null(:string))
    field(:email, non_null(:string))
    field(:password, non_null(:string))
    field(:password_confirmation, non_null(:string))
  end
end
