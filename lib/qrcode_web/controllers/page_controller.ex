defmodule QrcodeWeb.PageController do
  use QrcodeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
