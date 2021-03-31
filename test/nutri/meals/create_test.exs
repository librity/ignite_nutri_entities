defmodule Nutri.Meals.CreateTest do
  use Nutri.DataCase, async: true

  import Nutri.Factory

  alias Nutri.Meals.Create
  alias Nutri.{Error, Meal}

  describe "call/1" do
    test "return a meal if params are valid" do
      meal_params = build(:meal_params)

      return = Create.call(meal_params)

      assert {
               :ok,
               %Meal{
                 description: "Royal with cheese",
                 calories: 500,
                 date: ~N[1994-05-21 12:00:00],
                 id: _id
               }
             } = return
    end

    test "return an error if params aren't valid" do
      bad_meal_params = build(:bad_meal_params)

      return = Create.call(bad_meal_params)

      expected_errors = %{
        calories: ["must be less than 2000"],
        date: ["is invalid"],
        description: ["can't be blank"]
      }

      assert {:error, %Error{status: :bad_request, result: changeset}} = return
      assert errors_on(changeset) == expected_errors
    end
  end
end
