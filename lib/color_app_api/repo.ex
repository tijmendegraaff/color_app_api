defmodule ColorAppApi.Repo do
  use Ecto.Repo,
    otp_app: :color_app_api,
    adapter: Ecto.Adapters.Postgres
end
