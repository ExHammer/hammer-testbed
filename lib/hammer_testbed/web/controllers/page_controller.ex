defmodule HammerTestbed.Web.PageController do
  use HammerTestbed.Web, :controller
  import Logger

  def index(conn, _params) do
    render conn, "index.html"
  end

  def get_timestamp(conn, _params) do
    ip = conn.remote_ip
    |> Tuple.to_list
    |> Enum.join(".")
    case Hammer.check_rate("get_timestamp:#{ip}", 60_000, 5) do
      {:ok, _count} ->
        Logger.log(:info, "Rate-Limit ok, generating timestamp")
        now = DateTime.utc_now()
        conn
        |> json(%{timestamp: "#{now}"})
      {:error, _} ->
        Logger.log(:info, "Rate-Limit exceeded, denying request")
        conn |> send_resp(429, "Too many requests")
    end
  end
end
