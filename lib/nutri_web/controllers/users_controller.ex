defmodule NutriWeb.UsersController do
  use NutriWeb, :controller

  alias Nutri.User
  alias NutriWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Nutri.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
