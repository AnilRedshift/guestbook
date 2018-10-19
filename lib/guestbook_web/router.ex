defmodule GuestbookWeb.Router do
  use GuestbookWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GuestbookWeb do
    pipe_through :api
  end
end
