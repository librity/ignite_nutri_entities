defmodule Nutri.Meals.Update do
  alias Nutri.{Error, Meal, Repo}

  def call(%{"id" => id} = params) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.build_meal_not_found()}
      %Meal{} = meal -> try_to_update(meal, params)
    end
  end

  defp try_to_update(meal, params) do
    meal
    |> Meal.changeset(params)
    |> Repo.update()
    |> handle_update()
  end

  defp handle_update({:ok, %Meal{}} = success), do: success
  defp handle_update({:error, result}), do: {:error, Error.build(:bad_request, result)}
end
