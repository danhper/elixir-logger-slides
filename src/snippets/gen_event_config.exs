defmodule SlackLogger do
  use GenEvent

  def init(__MODULE__) do
    {:ok, configure([], %{})}
  end

  def handle_call({:configure, opts}, state) do
    {:ok, :ok, configure(opts, state)}
  end

  defp configure(opts, state) do
    config = Application.get_env(:logger, __MODULE__, [])
    |> Keyword.merge(opts)
    Application.put_env(:logger, __MODULE__, config)
    Map.merge(state, Enum.into(%{}, config))
  end
end
