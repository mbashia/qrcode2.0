import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :qrcode, Qrcode.Repo,
  username: "root",
  password: "",
  database: "qrcode_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :qrcode, QrcodeWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "MHpXJSQc2mvPJBCXgR0Vs8CDnXBhXO1oNYJT0ic80BhhLSqnXCvZENqDGICOxLjC",
  server: false

# In test we don't send emails.
config :qrcode, Qrcode.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
