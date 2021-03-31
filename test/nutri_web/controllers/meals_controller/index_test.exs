defmodule NutriWeb.MealsController.IndexTest do
  use NutriWeb.ConnCase, async: true

  import Nutri.Factory

  describe "index/2" do
    test "returns a list of all meal", %{conn: conn} do
      insert(:meal)

      response =
        conn
        |> get(Routes.meals_path(conn, :index, %{}))
        |> json_response(:ok)

      assert %{
               "meals" => [
                 %{
                   "id" => 12,
                   "calories" => 500,
                   "date" => "1994-05-21T12:00:00",
                   "description" => "Royal with cheese"
                 }
               ]
             } = response
    end
  end
end
