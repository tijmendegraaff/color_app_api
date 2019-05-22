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
    @desc "Return the current user"
    field :current_user, :user_type do
      middleware(Middleware.Authorize)
      resolve(&Resolvers.UserResolver.user/3)
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
      middleware(Middleware.Authorize)
      arg(:input, non_null(:palette_input_type))
      resolve(&Resolvers.PaletteResolver.create_palette/3)
    end

    @desc "Delete a color palette"
    field :delete_palette, type: :palette_type do
      middleware(Middleware.Authorize)
      arg(:palette_id, non_null(:id))
      resolve(&Resolvers.PaletteResolver.delete_palette/3)
    end
  end
end
