defmodule Discuss.Comment do
  @moduledoc """
  Comments about a specific topic.
  """
  use Ecto.Schema
  import Ecto.Changeset, warn: false

  @derive {Jason.Encoder, only: [:content, :user]}

  schema "comments" do
    field :content, :string
    belongs_to :user, Discuss.User
    belongs_to :topic, Discuss.Topic
    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:content])
    |> validate_required([:content])
  end
end
