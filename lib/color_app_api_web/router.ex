defmodule ColorAppApiWeb.Router do
  use ColorAppApiWeb, :router

  pipeline :api do
    plug CORSPlug, origin: "*"
    plug :accepts, ["json"]
    plug ColorAppApiWeb.Plugs.Context
  end

  scope "/api" do
    pipe_through :api

    forward(
      "/graphiql",
      Absinthe.Plug.GraphiQL,
      schema: ColorAppApiWeb.Schema
    )

    forward(
      "/",
      Absinthe.Plug,
      schema: ColorAppApiWeb.Schema
    )
  end
end
