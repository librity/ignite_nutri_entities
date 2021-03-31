defmodule Nutri.Meals.DeleteTest do
  use Nutri.DataCase, async: true

  import Nutri.Factory

  alias Nutri.Meals.Delete
  alias Nutri.Meal

  describe "call/1" do
    test "deletes the meal if it exists" do
      %Meal{id: id} = insert(:meal)

      return = Delete.call(id)

      assert {:ok, %Meal{id: 12, description: "Royal with cheese"}} = return
    end

    test "return an error if meal doesn't exist" do
      madeup_id = 123_312

      return = Delete.call(madeup_id)

      assert {:error, %Nutri.Error{result: "Meal not found", status: :not_found}} = return
    end
  end
end
