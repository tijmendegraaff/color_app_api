defmodule ColorAppApiWeb.Schema do
  use Absinthe.Schema

  alias ColorAppApiWeb.Resolvers

  import_types(ColorAppApiWeb.Schema.Types)

  alias ColorAppApiWeb.Resolvers

  query do
    @desc "Get a list of all users"
    field :users, list_of(:user_type) do
      resolve(&Resolvers.UserResolver.users/3)
    end
  end

  mutation do
    @desc "Create a new user"
    field :user, :user_type do
      arg(:input, non_null(:user_input_type))
      resolve(&Resolvers.UserResolver.create_user/3)
    end
  end
end
