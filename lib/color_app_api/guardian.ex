defmodule ColorAppApi.Guardian do
  use Guardian, otp_app: :color_app_api
  alias ColorAppApi.Accounts

  def subject_for_token(%Accounts.User{} = user, _claims) do
    user_id = to_string(user.id)
    {:ok, user_id}
  end

  def subject_for_token(_, _) do
    {:error, :reason_for_error}
  end

  def resource_from_claims(%{"sub" => user_id}) do
    user =
      user_id
      |> Accounts.get_user!()

    {:ok, user}
  end

  def resource_from_claims(_claims) do
    {:error, :reason_for_error}
  end
end
