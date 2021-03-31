defmodule Nutri.Meals.Create do
  alias Nutri.{Error, Meal, Repo}

  def call(params) do
    params
    |> Meal.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Meal{}} = success), do: success
  defp handle_insert({:error, result}), do: {:error, Error.build(:bad_request, result)}
end
