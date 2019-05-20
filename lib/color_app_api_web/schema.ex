defmodule ColorAppApiWeb.Schema do
  use Absinthe.Schema

  alias ColorAppApiWeb.Resolvers
  alias ColorAppApiWeb.Schema.Middleware

  import_types(ColorAppApiWeb.Schema.Types)

  def middleware(middleware, _field, %{identifier: :mutation}) do
    middleware ++ [Middleware.ChangesetErrors]
  end

  def middleware(middleware, _field, _object), do: middleware

  query do
    @desc "Get a list of all users"
    field :users, list_of(:user_type) do
      middleware(Middleware.Authorize)
      resolve(&Resolvers.UserResolver.users/3)
    end
  end

  mutation do
    @desc "Create a new user"
    field :create_user, :session_type do
      arg(:input, non_null(:user_input_type))
      resolve(&Resolvers.UserResolver.create_user/3)
    end

    @desc "Login a user and return a JWT token"
    field :create_session, type: :session_type do
      arg(:input, non_null(:session_input_type))
      resolve(&Resolvers.UserResolver.login/3)
    end

    @desc "Create a color palette"
    field :create_palette, type: :palette_type do
      arg(:input, non_null(:palette_input_type))
      resolve(&Resolvers.PaletteResolver.create_palette/3)
    end
  end
end
