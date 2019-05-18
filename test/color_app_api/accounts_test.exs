defmodule ColorAppApi.AccountsTest do
  use ColorAppApi.DataCase
  import ColorAppApi.Factory
  alias ColorAppApi.Accounts

  @valid_attrs %{
    first_name: "Tijmen",
    last_name: "de Graaff",
    email: "email@email.com",
    password: "password1234"
  }

  @invalid_attrs %{
    first_name: "Tijmen",
    last_name: "de Graaff",
    email: "email@email.com",
    password: "pa"
  }

  describe "users" do
    alias ColorAppApi.Accounts.User

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.email == "email@email.com"
      assert user.first_name == "Tijmen"
      assert user.last_name == "de Graaff"
      assert user.password_hash != nil
    end

    test "create_user/1 with a password < 8 characters returns error changeset" do
      assert {:error, %Ecto.Changeset{} = error} = Accounts.create_user(@invalid_attrs)
    end

    # test "list_users/0 returns all users" do
    #   user = user_fixture()
    #   assert Accounts.list_users() == [user]
    # end

    # test "get_user!/1 returns the user with given id" do
    #   user = user_fixture()
    #   assert Accounts.get_user!(user.id) == user
    # end

    # test "update_user/2 with valid data updates the user" do
    #   user = user_fixture()
    #   assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
    #   assert user.email == "email2@email.com"
    #   assert user.first_name == "some updated first_name"
    #   assert user.last_name == "some updated last_name"
    #   assert user.password == "some updated password"
    # end

    # test "update_user/2 with invalid data returns error changeset" do
    #   user = user_fixture()
    #   assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
    #   assert user == Accounts.get_user!(user.id)
    # end

    # test "delete_user/1 deletes the user" do
    #   user = user_fixture()
    #   assert {:ok, %User{}} = Accounts.delete_user(user)
    #   assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    # end

    # test "change_user/1 returns a user changeset" do
    #   user = user_fixture()
    #   assert %Ecto.Changeset{} = Accounts.change_user(user)
    # end
  end
end
