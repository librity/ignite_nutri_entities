defmodule NutriWeb.UsersViewTest do
  use NutriWeb.ConnCase, async: true

  import Phoenix.View
  import Nutri.Factory

  alias Nutri.User
  alias NutriWeb.UsersView

  test "renders create.json" do
    user = build(:user)

    return = render(UsersView, "create.json", user: user)

    assert %{
             user: %User{
               id: 12,
               cpf: "12345678910",
               email: "bad@mother.fff",
               name: "Jules",
               inserted_at: nil,
               updated_at: nil
             },
             message: "User created successfully"
           } = return
  end
end
