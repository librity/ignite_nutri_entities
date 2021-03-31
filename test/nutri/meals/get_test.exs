defmodule Nutri.Meals.GetTest do
  use Nutri.DataCase, async: true

  import Nutri.Factory

  alias Nutri.Meals.Get
  alias Nutri.Meal

  describe "by_id/1" do
    test "returns the meal if it exists" do
      %Meal{id: id} = insert(:meal)

      return = Get.by_id(id)

      assert {
               :ok,
               %Meal{
                 description: "Royal with cheese",
                 calories: 500,
                 date: ~N[1994-05-21 12:00:00],
                 id: 12
               }
             } = return
    end

    test "return an error if meal doesn't exist" do
      madeup_id = 123_312

      return = Get.by_id(madeup_id)

      assert {:error, %Nutri.Error{result: "Meal not found", status: :not_found}} = return
    end
  end
end
