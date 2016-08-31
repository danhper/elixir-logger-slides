defmodule SlackLogger do
  use GenEvent

  def handle_event({level, _gl, {Logger, message, _ts, _md}}, state) do
    IO.inspect(message)
    {:ok, state}
  end
end
