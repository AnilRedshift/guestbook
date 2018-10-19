defmodule GuestbookWeb.Router do
  use GuestbookWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GuestbookWeb do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
  end
end
