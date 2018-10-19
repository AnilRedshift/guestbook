defmodule Guestbook.Repo.Migrations.AddDisplayName do
  use Ecto.Migration

  def change do
    alter table("users") do
      add :display_name, :string
    end
  end
end
