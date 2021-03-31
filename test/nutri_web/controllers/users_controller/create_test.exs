defmodule NutriWeb.UsersController.CreateTest do
  use NutriWeb.ConnCase, async: true

  import Nutri.Factory

  describe "create/2" do
    test "returns a created user if params are valid", %{conn: conn} do
      user_params = build(:user_json)

      response =
        conn
        |> post(Routes.users_path(conn, :create, user_params))
        |> json_response(:created)

      assert %{
               "message" => "User created successfully",
               "user" => %{
                 "id" => _id,
                 "cpf" => "12345678910",
                 "email" => "bad@mother.fff",
                 "name" => "Jules"
               }
             } = response
    end

    test "returns an error if params aren't valid", %{conn: conn} do
      bad_user_params = build(:bad_user_json)

      response =
        conn
        |> post(Routes.users_path(conn, :create, bad_user_params))
        |> json_response(:bad_request)

      assert %{
               "message" => %{
                 "cpf" => ["should be 11 character(s)"],
                 "email" => ["has invalid format"]
               }
             } = response
    end
  end
end
