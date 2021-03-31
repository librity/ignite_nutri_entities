defmodule Nutri.Meals.GetAll do
  alias Nutri.{Meal, Repo}

  def call, do: Repo.all(Meal)
end
