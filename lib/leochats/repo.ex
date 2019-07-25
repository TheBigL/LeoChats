defmodule Leochats.Repo do
  use Ecto.Repo,
    otp_app: :leochats,
    adapter: Ecto.Adapters.Postgres
end
