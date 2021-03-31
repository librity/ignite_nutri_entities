defmodule Nutri.MealTest do
  use Nutri.DataCase, async: true

  import Nutri.Factory

  alias Ecto.Changeset
  alias Nutri.Meal

  describe "changeset/2" do
    test "returns a new valid changeset if all params are valid" do
      meal_params = build(:meal_params)

      return = Meal.changeset(meal_params)

      assert %Changeset{
               changes: %{
                 calories: 500,
                 date: ~N[1994-05-21 12:00:00],
                 description: "Royal with cheese"
               },
               valid?: true
             } = return
    end

    test "returns a valid changeset if all params are valid" do
      meal_params = build(:meal_params)

      new_meal_params = %{description: "UPDATEDDDDDD"}

      return =
        meal_params
        |> Meal.changeset()
        |> Meal.changeset(new_meal_params)

      assert %Changeset{changes: %{description: "UPDATEDDDDDD"}, valid?: true} = return
    end

    test "returns an invalid changeset if all params aren't valid" do
      bad_meal_params = build(:bad_meal_params)

      return =
        bad_meal_params
        |> Meal.changeset()

      expected_errors = %{
        calories: ["must be less than 2000"],
        date: ["is invalid"],
        description: ["can't be blank"]
      }

      assert %Changeset{valid?: false} = return
      assert errors_on(return) == expected_errors
    end
  end
end
