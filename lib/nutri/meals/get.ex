defmodule Nutri.Meals.Get do
  alias Nutri.{Error, Meal, Repo}

  def by_id(id) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.build_meal_not_found()}
      %Meal{} = meal -> {:ok, meal}
    end
  end
end
