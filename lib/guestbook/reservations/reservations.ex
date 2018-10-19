defmodule Guestbook.Reservations do
  @moduledoc """
  The Reservations context.
  """

  import Ecto.Query, warn: false
  alias Guestbook.Repo

  alias Guestbook.Reservations.SeattleReservation

  @doc """
  Returns the list of seattlereservations.

  ## Examples

      iex> list_seattlereservations()
      [%SeattleReservation{}, ...]

  """
  def list_seattlereservations do
    Repo.all(SeattleReservation)
  end

  @doc """
  Gets a single seattle_reservation.

  Raises `Ecto.NoResultsError` if the Seattle reservation does not exist.

  ## Examples

      iex> get_seattle_reservation!(123)
      %SeattleReservation{}

      iex> get_seattle_reservation!(456)
      ** (Ecto.NoResultsError)

  """
  def get_seattle_reservation!(id), do: Repo.get!(SeattleReservation, id)

  @doc """
  Creates a seattle_reservation.

  ## Examples

      iex> create_seattle_reservation(%{field: value})
      {:ok, %SeattleReservation{}}

      iex> create_seattle_reservation(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_seattle_reservation(attrs \\ %{}) do
    %SeattleReservation{}
    |> SeattleReservation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a seattle_reservation.

  ## Examples

      iex> update_seattle_reservation(seattle_reservation, %{field: new_value})
      {:ok, %SeattleReservation{}}

      iex> update_seattle_reservation(seattle_reservation, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_seattle_reservation(%SeattleReservation{} = seattle_reservation, attrs) do
    seattle_reservation
    |> SeattleReservation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a SeattleReservation.

  ## Examples

      iex> delete_seattle_reservation(seattle_reservation)
      {:ok, %SeattleReservation{}}

      iex> delete_seattle_reservation(seattle_reservation)
      {:error, %Ecto.Changeset{}}

  """
  def delete_seattle_reservation(%SeattleReservation{} = seattle_reservation) do
    Repo.delete(seattle_reservation)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking seattle_reservation changes.

  ## Examples

      iex> change_seattle_reservation(seattle_reservation)
      %Ecto.Changeset{source: %SeattleReservation{}}

  """
  def change_seattle_reservation(%SeattleReservation{} = seattle_reservation) do
    SeattleReservation.changeset(seattle_reservation, %{})
  end
end
