defmodule Nutri.Users.CreateTest do
  use Nutri.DataCase, async: true

  import Nutri.Factory

  alias Nutri.Users.Create
  alias Nutri.{Error, User}

  describe "call/1" do
    test "return a user if params are valid" do
      user_params = build(:user_params)

      return = Create.call(user_params)

      assert {
               :ok,
               %User{
                 id: _id,
                 cpf: "12345678910",
                 email: "bad@mother.fff",
                 name: "Jules"
               }
             } = return
    end

    test "return an error if params aren't valid" do
      bad_user_params = build(:bad_user_params)

      return = Create.call(bad_user_params)

      expected_errors = %{cpf: ["should be 11 character(s)"], email: ["has invalid format"]}

      assert {:error, %Error{status: :bad_request, result: changeset}} = return
      assert expected_errors == errors_on(changeset)
    end
  end
end
