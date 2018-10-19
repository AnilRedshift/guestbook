defmodule Guestbook.ReservationsTest do
  use Guestbook.DataCase

  alias Guestbook.Reservations

  describe "seattlereservations" do
    alias Guestbook.Reservations.SeattleReservation

    @valid_attrs %{dinner: true, plus_one: true, reception: true, wedding: true}
    @update_attrs %{dinner: false, plus_one: false, reception: false, wedding: false}
    @invalid_attrs %{dinner: nil, plus_one: nil, reception: nil, wedding: nil}

    def seattle_reservation_fixture(attrs \\ %{}) do
      {:ok, seattle_reservation} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Reservations.create_seattle_reservation()

      seattle_reservation
    end

    test "list_seattlereservations/0 returns all seattlereservations" do
      seattle_reservation = seattle_reservation_fixture()
      assert Reservations.list_seattlereservations() == [seattle_reservation]
    end

    test "get_seattle_reservation!/1 returns the seattle_reservation with given id" do
      seattle_reservation = seattle_reservation_fixture()
      assert Reservations.get_seattle_reservation!(seattle_reservation.id) == seattle_reservation
    end

    test "create_seattle_reservation/1 with valid data creates a seattle_reservation" do
      assert {:ok, %SeattleReservation{} = seattle_reservation} = Reservations.create_seattle_reservation(@valid_attrs)
      assert seattle_reservation.dinner == true
      assert seattle_reservation.plus_one == true
      assert seattle_reservation.reception == true
      assert seattle_reservation.wedding == true
    end

    test "create_seattle_reservation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Reservations.create_seattle_reservation(@invalid_attrs)
    end

    test "update_seattle_reservation/2 with valid data updates the seattle_reservation" do
      seattle_reservation = seattle_reservation_fixture()
      assert {:ok, seattle_reservation} = Reservations.update_seattle_reservation(seattle_reservation, @update_attrs)
      assert %SeattleReservation{} = seattle_reservation
      assert seattle_reservation.dinner == false
      assert seattle_reservation.plus_one == false
      assert seattle_reservation.reception == false
      assert seattle_reservation.wedding == false
    end

    test "update_seattle_reservation/2 with invalid data returns error changeset" do
      seattle_reservation = seattle_reservation_fixture()
      assert {:error, %Ecto.Changeset{}} = Reservations.update_seattle_reservation(seattle_reservation, @invalid_attrs)
      assert seattle_reservation == Reservations.get_seattle_reservation!(seattle_reservation.id)
    end

    test "delete_seattle_reservation/1 deletes the seattle_reservation" do
      seattle_reservation = seattle_reservation_fixture()
      assert {:ok, %SeattleReservation{}} = Reservations.delete_seattle_reservation(seattle_reservation)
      assert_raise Ecto.NoResultsError, fn -> Reservations.get_seattle_reservation!(seattle_reservation.id) end
    end

    test "change_seattle_reservation/1 returns a seattle_reservation changeset" do
      seattle_reservation = seattle_reservation_fixture()
      assert %Ecto.Changeset{} = Reservations.change_seattle_reservation(seattle_reservation)
    end
  end
end
