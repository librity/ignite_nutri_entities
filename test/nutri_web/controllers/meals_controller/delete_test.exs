defmodule NutriWeb.MealsController.DeleteTest do
  use NutriWeb.ConnCase, async: true

  import Nutri.Factory

  alias Nutri.{User, Meal}

  describe "delete/2" do
    test "deletes the meal if it exists", %{conn: conn} do
      %User{id: user_id} = insert(:user)
      %Meal{id: id} = insert(:meal, user_id: user_id)

      response =
        conn
        |> delete(Routes.meals_path(conn, :delete, id))
        |> json_response(:ok)

      assert %{
               "meal" => %{
                 "calories" => 500,
                 "date" => "1994-05-21T12:00:00",
                 "description" => "Royal with cheese",
                 "id" => 12
               }
             } = response
    end

    test "returns an error if meal doesn't exist", %{conn: conn} do
      madeup_id = 132_313

      response =
        conn
        |> delete(Routes.meals_path(conn, :delete, madeup_id))
        |> json_response(:not_found)

      assert %{"message" => "Meal not found"} = response
    end
  end
end
