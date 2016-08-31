require Logger

Logger.info("This is a log message")

Logger.debug(fn -> expensive_computation() end)

Logger.error("An error occurred")
