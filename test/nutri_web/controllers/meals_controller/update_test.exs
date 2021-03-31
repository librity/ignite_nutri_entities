defmodule NutriWeb.MealsController.UpdateTest do
  use NutriWeb.ConnCase, async: true

  import Nutri.Factory

  alias Nutri.Meal

  describe "update/2" do
    test "returns the updated meal if params are valid", %{conn: conn} do
      %Meal{id: id} = insert(:meal)

      update_params =
        build(:meal_json, %{
          "description" => "UPDATEDDDDD",
          "calories" => 1000,
          "date" => "1980-05-21T12:00:00"
        })

      response =
        conn
        |> put(Routes.meals_path(conn, :update, id, update_params))
        |> json_response(:ok)

      assert %{
               "meal" => %{
                 "calories" => 1000,
                 "date" => "1980-05-21T12:00:00",
                 "description" => "UPDATEDDDDD",
                 "id" => 12
               }
             } = response
    end

    test "returns an error if params aren't valid", %{conn: conn} do
      %Meal{id: id} = insert(:meal)

      bad_params = build(:bad_meal_json)

      response =
        conn
        |> put(Routes.meals_path(conn, :update, id, bad_params))
        |> json_response(:bad_request)

      assert %{
               "message" => %{
                 "calories" => ["must be less than 2000"],
                 "date" => ["is invalid"],
                 "description" => ["can't be blank"]
               }
             } = response
    end

    test "returns an error if meal doesn't exit", %{conn: conn} do
      update_params = build(:meal_json)
      madeup_id = 132_313

      response =
        conn
        |> put(Routes.meals_path(conn, :update, madeup_id, update_params))
        |> json_response(:not_found)

      assert %{"message" => "Meal not found"} = response
    end
  end
end
