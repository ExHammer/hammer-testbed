defmodule HammerTestbed.RateLimiter do
  use Supervisor

  def start_link() do
    Supervisor.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    children = [
      # worker(Hammer.Backend.ETS, []),
      worker(Hammer.Backend.Redis, []),
      worker(Hammer, [[backend: Hammer.Backend.Redis,
                       expiry: 1000 * 60 * 5,
                       cleanup_rate: 1000 * 60 * 12]])
    ]
    supervise(children, strategy: :one_for_one, name: HammerTestbed.RateLimiter)
  end
end
