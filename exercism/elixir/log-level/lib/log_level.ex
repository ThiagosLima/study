defmodule LogLevel do
  @log_table %{
    {0, false} => :trace,
    {1, true} => :debug,
    {1, false} => :debug,
    {2, true} => :info,
    {2, false} => :info,
    {3, true} => :warning,
    {3, false} => :warning,
    {4, true} => :error,
    {4, false} => :error,
    {5, false} => :fatal
  }

  def to_label(level, legacy) do
    Map.get(@log_table, {level, legacy}, :unknown)
  end

  def alert_recipient(level, legacy) do
    case to_label(level, legacy) do
      alert when alert in [:error, :fatal] ->
        :ops

      :unknown when legacy == true ->
        :dev1

      :unknown when legacy == false ->
        :dev2

      _ ->
        nil
    end
  end
end
