defmodule Guestbook.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :name, :string
    field :display_name, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :display_name])
    |> validate_required([:name, :display_name])
    |> unique_constraint(:name)
  end
end
