defmodule DiscussWeb.Plugs.RequireAuth do
  @moduledoc """
  Makes sure there's an user logged in to perform certain actions.
  """
  import Plug.Conn
  import Phoenix.Controller

  alias DiscussWeb.Router.Helpers, as: Routes

  def init(default), do: default

  def call(conn, _default) do
    if conn.assigns[:user] do
      conn
    else
      conn
      |> put_flash(:error, "You must be logged in.")
      |> redirect(to: Routes.topic_path(conn, :index))
      |> halt()
    end
  end
end
