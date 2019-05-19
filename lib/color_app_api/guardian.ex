defmodule ColorAppApi.Guardian do
  use Guardian, otp_app: :color_app_api
  alias ColorAppApi.Accounts

  def subject_for_token(%Accounts.User{} = user, _claims) do
    sub = to_string(user.id)
    {:ok, sub}
  end

  def subject_for_token(_, _) do
    {:error, :reason_for_error}
  end

  def resource_from_claims(%{"sub" => id}) do
    resource = Accounts.get_user!(id)
    {:ok, resource}
  end

  def resource_from_claims(_claims) do
    {:error, :reason_for_error}
  end
end
