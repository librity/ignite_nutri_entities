defmodule Nutri.UserTest do
  use Nutri.DataCase, async: true

  import Nutri.Factory

  alias Ecto.Changeset
  alias Nutri.User

  describe "changeset/2" do
    test "returns a new valid changeset if all params are valid" do
      user_params = build(:user_params)

      return = User.changeset(user_params)

      assert %Changeset{
               changes: %{cpf: "12345678910", email: "bad@mother.fff", name: "Jules"},
               valid?: true
             } = return
    end

    test "returns a valid changeset if all params are valid" do
      user_params = build(:user_params)

      new_user_params = %{name: "UPDATEDDDDDD"}

      return =
        user_params
        |> User.changeset()
        |> User.changeset(new_user_params)

      assert %Changeset{changes: %{name: "UPDATEDDDDDD"}, valid?: true} = return
    end

    test "returns an invalid changeset if all params aren't valid" do
      bad_user_params = build(:bad_user_params)

      return =
        bad_user_params
        |> User.changeset()

      expected_errors = %{cpf: ["should be 11 character(s)"], email: ["has invalid format"]}

      assert %Changeset{valid?: false} = return
      assert expected_errors == errors_on(return)
    end
  end
end
