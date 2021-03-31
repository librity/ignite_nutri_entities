defmodule NutriWeb.MealsController.ShowTest do
  use NutriWeb.ConnCase, async: true

  import Nutri.Factory

  alias Nutri.{User, Meal}

  describe "show/2" do
    test "returns the meal if params are valid", %{conn: conn} do
      %User{id: user_id} = insert(:user)
      %Meal{id: id} = insert(:meal, user_id: user_id)

      response =
        conn
        |> get(Routes.meals_path(conn, :show, id))
        |> json_response(:ok)

      assert %{
               "meal" => %{
                 "id" => 12,
                 "calories" => 500,
                 "date" => "1994-05-21T12:00:00",
                 "description" => "Royal with cheese"
               }
             } = response
    end

    test "returns an error if meal doesn't exist", %{conn: conn} do
      madeup_id = 132_313

      response =
        conn
        |> get(Routes.meals_path(conn, :show, madeup_id))
        |> json_response(:not_found)

      assert %{"message" => "Meal not found"} = response
    end
  end
end
