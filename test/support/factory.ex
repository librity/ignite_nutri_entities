defmodule Nutri.Factory do
  use ExMachina.Ecto, repo: Nutri.Repo

  alias Nutri.Meal

  def meal_params_factory do
    %{
      description: "Royal with cheese",
      date: "1994-05-21 12:00:00",
      calories: 500
    }
  end

  def meal_json_factory do
    build(:meal_params)
    |> stringify_map()
  end

  def bad_meal_params_factory do
    %{
      description: "  ",
      date: "1994-05-2112:00:00",
      calories: 9000
    }
  end

  def bad_meal_json_factory do
    build(:bad_meal_params)
    |> stringify_map()
  end

  def meal_factory do
    %Meal{
      id: 12,
      description: "Royal with cheese",
      date: "1994-05-21 12:00:00",
      calories: 500
    }
  end

  defp stringify_map(map) do
    for {key, val} <- map, into: %{}, do: {Atom.to_string(key), val}
  end
end
