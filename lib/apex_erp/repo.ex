defmodule ApexErp.Repo do
  use Ecto.Repo,
    otp_app: :apex_erp,
    adapter: Ecto.Adapters.Postgres
end
