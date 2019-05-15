defmodule ColorAppApiWeb.Router do
  use ColorAppApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ColorAppApiWeb do
    pipe_through :api
  end
end
