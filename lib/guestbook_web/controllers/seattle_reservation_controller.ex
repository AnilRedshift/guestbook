defmodule GuestbookWeb.SeattleReservationController do
  use GuestbookWeb, :controller

  alias Guestbook.Reservations
  alias Guestbook.Reservations.SeattleReservation

  action_fallback GuestbookWeb.FallbackController

  def index(conn, _params) do
    seattlereservations = Reservations.list_seattlereservations()
    render(conn, "index.json", seattlereservations: seattlereservations)
  end

  def create(conn, %{"seattle_reservation" => seattle_reservation_params}) do
    with {:ok, %SeattleReservation{} = seattle_reservation} <- Reservations.create_seattle_reservation(seattle_reservation_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", seattle_reservation_path(conn, :show, seattle_reservation))
      |> render("show.json", seattle_reservation: seattle_reservation)
    end
  end

  def show(conn, %{"id" => id}) do
    seattle_reservation = Reservations.get_seattle_reservation!(id)
    render(conn, "show.json", seattle_reservation: seattle_reservation)
  end

  def update(conn, %{"id" => id, "seattle_reservation" => seattle_reservation_params}) do
    seattle_reservation = Reservations.get_seattle_reservation!(id)

    with {:ok, %SeattleReservation{} = seattle_reservation} <- Reservations.update_seattle_reservation(seattle_reservation, seattle_reservation_params) do
      render(conn, "show.json", seattle_reservation: seattle_reservation)
    end
  end

  def delete(conn, %{"id" => id}) do
    seattle_reservation = Reservations.get_seattle_reservation!(id)
    with {:ok, %SeattleReservation{}} <- Reservations.delete_seattle_reservation(seattle_reservation) do
      send_resp(conn, :no_content, "")
    end
  end
end
