defmodule Nutri.Factory do
  use ExMachina.Ecto, repo: Nutri.Repo

  alias Nutri.{User, Meal}

  def user_params_factory do
    %{
      name: "Jules",
      email: "bad@mother.fff",
      cpf: "12345678910"
    }
  end

  def user_json_factory do
    build(:user_params)
    |> stringify_map()
  end

  def bad_user_params_factory do
    %{
      name: "Jules",
      email: "badmother.fff",
      cpf: "1234567891"
    }
  end

  def bad_user_json_factory do
    build(:bad_user_params)
    |> stringify_map()
  end

  def user_factory do
    %User{
      id: 12,
      name: "Jules",
      email: "bad@mother.fff",
      cpf: "12345678910"
    }
  end

  def meal_params_factory do
    %{
      user_id: 12,
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
      user_id: 12,
      description: "Royal with cheese",
      date: "1994-05-21 12:00:00",
      calories: 500
    }
  end

  defp stringify_map(map) do
    for {key, val} <- map, into: %{}, do: {Atom.to_string(key), val}
  end
end
