defmodule GuestbookWeb.SeattleReservationView do
  use GuestbookWeb, :view
  alias GuestbookWeb.SeattleReservationView

  def render("index.json", %{seattlereservations: seattlereservations}) do
    %{data: render_many(seattlereservations, SeattleReservationView, "seattle_reservation.json")}
  end

  def render("show.json", %{seattle_reservation: seattle_reservation}) do
    %{data: render_one(seattle_reservation, SeattleReservationView, "seattle_reservation.json")}
  end

  def render("seattle_reservation.json", %{seattle_reservation: seattle_reservation}) do
    %{id: seattle_reservation.id,
      dinner: seattle_reservation.dinner,
      wedding: seattle_reservation.wedding,
      reception: seattle_reservation.reception,
      plus_one: seattle_reservation.plus_one}
  end
end
