defmodule Icy.Repo do
  use Ecto.Repo,
    otp_app: :icy,
    adapter: Ecto.Adapters.Postgres
end
