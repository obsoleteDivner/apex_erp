import Config

config :apex_erp,
  ecto_repos: [ApexErp.Repo],
  generators: [timestamp_type: :utc_datetime]

config :apex_erp, ApexErpWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [html: ApexErpWeb.ErrorHTML, json: ApexErpWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: ApexErp.PubSub,
  live_view: [signing_salt: "aVRtGEAV"]

config :apex_erp, ApexErp.Mailer, adapter: Swoosh.Adapters.Local

config :esbuild,
  version: "0.17.11",
  apex_erp: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :tailwind,
  version: "3.4.3",
  apex_erp: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

config :bcrypt_elixir, log_rounds: 4


import_config "#{config_env()}.exs"
