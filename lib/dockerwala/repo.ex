defmodule Dockerwala.Repo do
  use Ecto.Repo,
    otp_app: :dockerwala,
    adapter: Ecto.Adapters.Postgres
end
