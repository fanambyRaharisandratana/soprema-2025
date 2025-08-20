defmodule Soprema.Repo do
  use Ecto.Repo,
    otp_app: :soprema,
    adapter: Ecto.Adapters.Postgres
end
