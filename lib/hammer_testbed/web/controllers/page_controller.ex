defmodule HammerTestbed.Web.PageController do
  use HammerTestbed.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
