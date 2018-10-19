defmodule Guestbook.Repo.Migrations.CreateSeattlereservations do
  use Ecto.Migration

  def change do
    create table(:seattlereservations) do
      add :dinner, :boolean, default: false, null: false
      add :wedding, :boolean, default: false, null: false
      add :reception, :boolean, default: false, null: false
      add :plus_one, :boolean, default: false, null: false
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create index(:seattlereservations, [:user_id])
  end
end
