defmodule HammerTestbed.RateLimiter do
  use Supervisor

  # Use the Hammer module, creates `check_rate`, `inspect_bucket`,
  # and `delete_buckets` functions in this module

  # use Hammer, backend: Hammer.Backend.ETS
  use Hammer, backend: Hammer.Backend.Redis

  def start_link() do
    Supervisor.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    children = [
      # Start the Hammer backend process
      # worker(Hammer.Backend.ETS, [[expiry_ms: 1000 * 60 * 10,
      #                              cleanup_rate_ms: 1000 * 60 * 2]]),
      worker(Hammer.Backend.Redis, [[expiry_ms: 1000 * 60 * 2,
                                     redix_config: []]]),
    ]
    supervise(children, strategy: :one_for_one, name: HammerTestbed.RateLimiter)
  end
end
