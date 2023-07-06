defmodule Qrcode.Repo do
  use Ecto.Repo,
    otp_app: :qrcode,
    adapter: Ecto.Adapters.MyXQL
end
