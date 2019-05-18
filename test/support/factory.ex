defmodule ColorAppApi.Factory do
  use ExMachina.Ecto, repo: ColorAppApi.Repo

  def user_factory do
    %ColorAppApi.Accounts.User{
      first_name: "Tijmen",
      last_name: "de Graaff",
      email: "example@email.com",
      password: "password1234",
      password_hash: Argon2.hash_pwd_salt("password1234")
    }
  end
end
