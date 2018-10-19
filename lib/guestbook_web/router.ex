defmodule GuestbookWeb.Router do
  use GuestbookWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug CORSPlug, origin: ["https://anilandstina.club", "https://www.anilandstina.club"]
  end

  scope "/", GuestbookWeb do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
  end
end
