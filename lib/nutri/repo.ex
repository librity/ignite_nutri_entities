defmodule Nutri.Repo do
  use Ecto.Repo,
    otp_app: :nutri,
    adapter: Ecto.Adapters.Postgres
end
