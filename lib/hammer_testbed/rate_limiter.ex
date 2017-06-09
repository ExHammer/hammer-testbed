defmodule HammerTestbed.RateLimiter do
  use Supervisor

  def start_link() do
    Supervisor.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    children = [
      worker(Hammer.Backend.ETS, []),
      worker(Hammer, [[backend: Hammer.Backend.ETS]])
    ]
    supervise(children, strategy: :one_for_one)
  end
end
