defmodule GuestbookWeb.ChangesetView do
  use GuestbookWeb, :view

  def translate_errors(changeset), do: changeset

  def render("error.json", %{changeset: changeset}) do
    # When encoded, the changeset returns its errors
    # as a JSON object. So we just pass it forward.
    %{errors: changeset}
  end
end
