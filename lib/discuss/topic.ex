defmodule Discuss.Topic do
  @moduledoc """
  Topic model for discussions. This is the core of the application.
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "topics" do
    field :title, :string
    belongs_to :user, Discuss.User
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title])
    |> validate_required([:title])
  end
end
