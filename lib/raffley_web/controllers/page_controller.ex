defmodule RaffleyWeb.PageController do
  use RaffleyWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
