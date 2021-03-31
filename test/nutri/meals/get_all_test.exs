defmodule Nutri.Meals.GetAllTest do
  use Nutri.DataCase, async: true

  import Nutri.Factory

  alias Nutri.Meal
  alias Nutri.Meals.GetAll

  describe "call/1" do
    test "returns a list with all the meals" do
      insert(:meal)

      return = GetAll.call()

      assert [
               %Meal{
                 description: "Royal with cheese",
                 calories: 500,
                 date: ~N[1994-05-21 12:00:00],
                 id: 12
               }
             ] = return
    end
  end
end
