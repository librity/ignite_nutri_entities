defmodule NutriWeb.MealsViewTest do
  use NutriWeb.ConnCase, async: true

  import Phoenix.View
  import Nutri.Factory

  alias Nutri.Meal
  alias NutriWeb.MealsView

  test "renders meals.json" do
    meals = build_list(2, :meal)

    return = render(MealsView, "meals.json", meals: meals)

    assert %{
             meals: [
               %Meal{
                 calories: 500,
                 date: "1994-05-21 12:00:00",
                 description: "Royal with cheese",
                 id: 12,
                 inserted_at: nil,
                 updated_at: nil
               },
               %Meal{
                 calories: 500,
                 date: "1994-05-21 12:00:00",
                 description: "Royal with cheese",
                 id: 12,
                 inserted_at: nil,
                 updated_at: nil
               }
             ]
           } = return
  end

  test "renders meal.json" do
    meal = build(:meal)

    return = render(MealsView, "meal.json", meal: meal)

    assert %{
             meal: %Meal{
               calories: 500,
               date: "1994-05-21 12:00:00",
               description: "Royal with cheese",
               id: 12,
               inserted_at: nil,
               updated_at: nil
             }
           } = return
  end

  test "renders create.json" do
    meal = build(:meal)

    return = render(MealsView, "create.json", meal: meal)

    assert %{
             meal: %Meal{
               calories: 500,
               date: "1994-05-21 12:00:00",
               description: "Royal with cheese",
               id: 12,
               inserted_at: nil,
               updated_at: nil
             },
             message: "Meal created successfully"
           } = return
  end
end
