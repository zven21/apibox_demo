defmodule ApiboxDemo.Repo do
  use Ecto.Repo,
    otp_app: :apibox_demo,
    adapter: Ecto.Adapters.Postgres
end
