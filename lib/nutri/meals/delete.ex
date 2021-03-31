defmodule Nutri.Meals.Delete do
  alias Nutri.{Error, Meal, Repo}

  def call(id) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.build_meal_not_found()}
      %Meal{} = meal -> Repo.delete(meal)
    end
  end
end
