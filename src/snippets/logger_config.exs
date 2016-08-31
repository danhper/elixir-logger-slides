config :logger,
  backends: [:console, {LoggerFileBackend, :file_log}]

config :logger, :console,
  level: :debug

config :logger, :file_log,
  path: "/var/log/my_app/error.log",
  level: :info
