defmodule GuestbookWeb.SeattleReservationControllerTest do
  use GuestbookWeb.ConnCase

  alias Guestbook.Reservations
  alias Guestbook.Reservations.SeattleReservation

  @create_attrs %{dinner: true, plus_one: true, reception: true, wedding: true}
  @update_attrs %{dinner: false, plus_one: false, reception: false, wedding: false}
  @invalid_attrs %{dinner: nil, plus_one: nil, reception: nil, wedding: nil}

  def fixture(:seattle_reservation) do
    {:ok, seattle_reservation} = Reservations.create_seattle_reservation(@create_attrs)
    seattle_reservation
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all seattlereservations", %{conn: conn} do
      conn = get conn, seattle_reservation_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create seattle_reservation" do
    test "renders seattle_reservation when data is valid", %{conn: conn} do
      conn = post conn, seattle_reservation_path(conn, :create), seattle_reservation: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, seattle_reservation_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "dinner" => true,
        "plus_one" => true,
        "reception" => true,
        "wedding" => true}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, seattle_reservation_path(conn, :create), seattle_reservation: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update seattle_reservation" do
    setup [:create_seattle_reservation]

    test "renders seattle_reservation when data is valid", %{conn: conn, seattle_reservation: %SeattleReservation{id: id} = seattle_reservation} do
      conn = put conn, seattle_reservation_path(conn, :update, seattle_reservation), seattle_reservation: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, seattle_reservation_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "dinner" => false,
        "plus_one" => false,
        "reception" => false,
        "wedding" => false}
    end

    test "renders errors when data is invalid", %{conn: conn, seattle_reservation: seattle_reservation} do
      conn = put conn, seattle_reservation_path(conn, :update, seattle_reservation), seattle_reservation: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete seattle_reservation" do
    setup [:create_seattle_reservation]

    test "deletes chosen seattle_reservation", %{conn: conn, seattle_reservation: seattle_reservation} do
      conn = delete conn, seattle_reservation_path(conn, :delete, seattle_reservation)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, seattle_reservation_path(conn, :show, seattle_reservation)
      end
    end
  end

  defp create_seattle_reservation(_) do
    seattle_reservation = fixture(:seattle_reservation)
    {:ok, seattle_reservation: seattle_reservation}
  end
end
