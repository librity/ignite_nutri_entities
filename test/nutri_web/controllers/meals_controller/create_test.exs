defmodule NutriWeb.MealsController.CreateTest do
  use NutriWeb.ConnCase, async: true

  import Nutri.Factory

  describe "create/2" do
    test "returns a created meal if params are valid", %{conn: conn} do
      meal_params = build(:meal_json)

      response =
        conn
        |> post(Routes.meals_path(conn, :create, meal_params))
        |> json_response(:created)

      assert %{
               "meal" => %{
                 "id" => _id,
                 "calories" => 500,
                 "date" => "1994-05-21T12:00:00",
                 "description" => "Royal with cheese"
               },
               "message" => "Meal created successfully"
             } = response
    end

    test "returns an error if params aren't valid", %{conn: conn} do
      bad_meal_params = build(:bad_meal_json)

      response =
        conn
        |> post(Routes.meals_path(conn, :create, bad_meal_params))
        |> json_response(:bad_request)

      assert %{
               "message" => %{
                 "calories" => ["must be less than 2000"],
                 "date" => ["is invalid"],
                 "description" => ["can't be blank"]
               }
             } = response
    end
  end
end
