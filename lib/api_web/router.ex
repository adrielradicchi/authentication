defmodule ApiWeb.Router do
  use ApiWeb, :router

  alias Api.Guardian

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :jwt_authenticated do 
  	plug Guardian.AuthPipeline
  end

  scope "/api", ApiWeb do
    pipe_through :api

    #resources "/users", UserController, only: [:create, :show]
    post "/sign_up", UserController, :create
    post "/sign_in", UserController, :sign_in
  end

  scope "/api", ApiWeb do 
  	pipe_through [:api, :jwt_authenticated]

  	get "/my_user", UserController, :show
  end

end
