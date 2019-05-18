defmodule ColorAppApiWeb.Router do
  use ColorAppApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
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
