defmodule ColorAppApiWeb.Schema.Middleware.Authorize do
  @behaviour Absinthe.Middleware

  alias ColorAppApi.Accounts.User

  def call(resolution, _) do
    with %{user: %User{}} <- resolution.context do
      resolution
    else
      _ ->
        resolution
        |> Absinthe.Resolution.put_result({:error, "unauthorized"})
    end
  end
end
