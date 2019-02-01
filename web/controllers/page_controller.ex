defmodule GraphqlServer.PageController do
  use GraphqlServer.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
