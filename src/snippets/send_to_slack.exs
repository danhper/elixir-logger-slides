defmodule SlackLogger do
  def handle_event({level, _gl, {Logger, msg, _, _}}, %{level: log_level} = state) do
    if meet_level?(level, log_level) do
      post_to_slack(level, msg, state)
    end
    {:ok, state}
  end

  defp meet_level?(_lvl, nil), do: true
  defp meet_level?(lvl, min) do
    Logger.compare_levels(lvl, min) != :lt
  end

  defp post_to_slack(level, message, %{hook_url: hook_url} = state) do
    headers = [{"Content-Type", "application/json"}]
    payload = ~s({"text": "#{message}", "icon_emoji": ":warning:"})
    :hackney.post(hook_url, headers, payload)
  end
end
