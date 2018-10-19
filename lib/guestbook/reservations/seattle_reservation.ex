defmodule Guestbook.Reservations.SeattleReservation do
  use Ecto.Schema
  import Ecto.Changeset


  schema "seattlereservations" do
    field :dinner, :boolean, default: false
    field :plus_one, :boolean, default: false
    field :reception, :boolean, default: false
    field :wedding, :boolean, default: false
    field :user_id, :id
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(seattle_reservation, attrs) do
    seattle_reservation
    |> cast(attrs, [:dinner, :wedding, :reception, :plus_one])
    |> validate_required([:dinner, :wedding, :reception, :plus_one])
  end
end
