defmodule HammerTestbed.Web.PageController do
  use HammerTestbed.Web, :controller
  import Logger
  alias HammerTestbed.RateLimiter

  def index(conn, _params) do
    render conn, "index.html"
  end

  def get_timestamp(conn, _params) do
    # Get a (semi) unique identifier for this user
    ip = conn.remote_ip
    |> Tuple.to_list
    |> Enum.join(".")
    # Do the rate-limit check, permit five hits per minute
    case RateLimiter.check_rate("get_timestamp:#{ip}", 60_000, 5) do
      # Action is allowed
      {:allow, _count} ->
        Logger.log(:info, "Rate-Limit ok, generating timestamp")
        now = DateTime.utc_now()
        conn |> json(%{timestamp: "#{now}"})
      # Action is denied, because the rate-limit has been exceeded
      # for this time-period
      {:deny, _} ->
        Logger.log(:info, "Rate-Limit exceeded, denying request")
        conn |> send_resp(429, "Too many requests")
    end
  end
end
