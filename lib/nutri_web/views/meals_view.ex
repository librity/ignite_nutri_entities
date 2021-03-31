defmodule NutriWeb.MealsView do
  alias Nutri.Meal

  def render("meals.json", %{meals: [%Meal{} | _tails] = meals}), do: %{meals: meals}
  def render("meal.json", %{meal: meal}), do: %{meal: meal}

  def render("create.json", %{meal: %Meal{} = meal}),
    do: %{message: "Meal created successfully", meal: meal}
end
