defmodule Nutri.Meals.UpdateTest do
  use Nutri.DataCase, async: true

  import Nutri.Factory

  alias Nutri.Meals.Update
  alias Nutri.{Error, User, Meal}

  describe "call/1" do
    test "return the updated meal if params are valid" do
      %User{id: user_id} = insert(:user)
      %Meal{id: id} = insert(:meal, user_id: user_id)

      meal_params = build(:meal_json, %{"id" => id, "description" => "UPDATEDDDDD"})

      return = Update.call(meal_params)

      assert {:ok, %Meal{description: "UPDATEDDDDD", id: 12}} = return
    end

    test "return an error if params aren't valid" do
      %User{id: user_id} = insert(:user)
      %Meal{id: id} = insert(:meal, user_id: user_id)

      bad_meal_params = build(:bad_meal_json, %{"id" => id})

      return = Update.call(bad_meal_params)

      expected_errors = %{
        calories: ["must be less than 2000"],
        date: ["is invalid"],
        description: ["can't be blank"]
      }

      assert {:error, %Error{status: :bad_request, result: changeset}} = return
      assert expected_errors == errors_on(changeset)
    end
  end
end
