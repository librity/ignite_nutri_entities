defmodule NutriWeb.UsersView do
  alias Nutri.User

  def render("create.json", %{user: %User{} = user}),
    do: %{message: "User created successfully", user: user}
end
