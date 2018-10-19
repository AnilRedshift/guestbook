defmodule Guestbook.Reservations.SeattleReservation do
  use Ecto.Schema
  import Ecto.Changeset


  schema "seattlereservations" do
    field :dinner, :boolean, default: false
    field :plus_one, :boolean, default: false
    field :reception, :boolean, default: false
    field :wedding, :boolean, default: false
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(seattle_reservation, attrs) do
    seattle_reservation
    |> cast(attrs, [:dinner, :wedding, :reception, :plus_one, :user_id])
    |> validate_required([:dinner, :wedding, :reception, :plus_one, :user_id])
    |> unique_constraint(:user_id)
  end
end
