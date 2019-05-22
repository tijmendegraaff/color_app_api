defmodule ColorAppApiWeb.Resolvers.UserResolver do
  alias ColorAppApi.Accounts
  alias ColorAppApi.Guardian

  def users(_, _, %{context: %{user: user}}) do
    {:ok, Accounts.list_users()}
  end

  def user(_, _, %{context: %{user: user}}) do
    {:ok, Accounts.get_user!(user.id)}
  end

  def create_user(_, %{input: input}, _) do
    with {:ok, user} <- Accounts.create_user(input),
         {:ok, jwt, _} <- Guardian.encode_and_sign(user) do
      {:ok, %{token: jwt, user: user}}
    end
  end

  def login(_, %{input: input}, _) do
    with {:ok, user} <- Accounts.Session.authenticate(input),
         {:ok, jwt, _} <- Guardian.encode_and_sign(user) do
      {:ok, %{token: jwt, user: user}}
    end
  end
end
