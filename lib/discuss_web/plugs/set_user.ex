defmodule DiscussWeb.Plugs.SetUser do
  @moduledoc """
  Provides a plug that makes sure current session has a user, even if it's nil.
  """
  import Plug.Conn

  alias Discuss.Repo
  alias Discuss.User
  # alias Discuss.Router.Helpers

  def init(default), do: default

  def call(conn, _params) do
    user_id = get_session(conn, :user_id)

    if user = user_id && Repo.get(User, user_id) do
      assign(conn, :user, user)
    else
      assign(conn, :user, nil)
    end
  end
end
