defmodule ColorAppApi.Accounts.Session do
  alias ColorAppApi.Accounts.User
  alias ColorAppApi.Repo

  def authenticate(args) do
    user = Repo.get_by(User, email: String.downcase(args.email))

    case check_password(user, args) do
      true -> {:ok, user}
      _ -> {:error, "Incorrect login credentials"}
    end
  end

  defp check_password(%User{password_hash: password_hash}, params) do
    Argon2.verify_pass(params.password, password_hash)
  end

  defp check_password(_, params) do
    false
  end
end
