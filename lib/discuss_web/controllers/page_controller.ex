defmodule DiscussWeb.PageController do
  use DiscussWeb, :controller

  alias DiscussWeb.Router.Helpers, as: Routes

  def index(conn, _params) do
    conn |> redirect(to: Routes.topic_path(conn, :index))
  end
end
