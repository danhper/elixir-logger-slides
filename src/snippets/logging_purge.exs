iex(1)> quote(do: Logger.debug("hello")) |> Macro.expand(__ENV__)
        |> Macro.to_string() |> IO.puts()
Logger.bare_log(:debug, "hello", [module: nil, function: nil, file: "iex", line: 0] ++ [])

iex(2)> Logger.configure(compile_time_purge_level: :info)

iex(3)> quote(do: Logger.debug("hello")) |> Macro.expand(__ENV__)
        |> Macro.to_string() |> IO.puts()
:ok
