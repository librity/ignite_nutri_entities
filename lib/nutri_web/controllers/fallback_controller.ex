defmodule NutriWeb.FallbackController do
  use NutriWeb, :controller

  alias Nutri.Error
  alias NutriWeb.ErrorView

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
