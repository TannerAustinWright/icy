import Config

config :icy, ecto_repos: [Icy.Repo]

config :icy, Icy.Repo,
  database: "icy",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :icy, Oban,
  repo: Icy.Repo,
  queues: [default: 10]
  # queues: []
