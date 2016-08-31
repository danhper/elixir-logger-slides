Logger.add_backend({LoggerFileBackend, :debug})
Logger.configure_backend({LoggerFileBackend, :debug},
  path: "/path/to/debug.log",
  format: ...,
  metadata: ...,
  metadata_filter: ...
)
