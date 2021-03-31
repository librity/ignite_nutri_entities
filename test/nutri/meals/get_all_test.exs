defmodule Nutri.Meals.GetAllTest do
  use Nutri.DataCase, async: true

  import Nutri.Factory

  alias Nutri.{User, Meal}
  alias Nutri.Meals.GetAll

  describe "call/1" do
    test "returns a list with all the meals" do
      %User{id: user_id} = insert(:user)
      insert(:meal, user_id: user_id)

      return = GetAll.call()

      assert [
               %Meal{
                 id: 12,
                 user_id: ^user_id,
                 description: "Royal with cheese",
                 calories: 500,
                 date: ~N[1994-05-21 12:00:00]
               }
             ] = return
    end
  end
end
