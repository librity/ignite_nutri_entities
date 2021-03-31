defmodule Nutri.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Nutri.Meal

  @required_keys [:name, :email, :cpf]

  @derive {Jason.Encoder, only: @required_keys ++ [:id]}

  schema "users" do
    field :name, :string
    field :email, :string
    field :cpf, :string

    has_many :meals, Meal

    timestamps()
  end

  def changeset(user \\ %__MODULE__{}, params) do
    user
    |> cast(params, @required_keys)
    |> validate_required(@required_keys)
    |> validate_fields()
    |> check_constraints()
  end

  defp validate_fields(changeset) do
    changeset
    |> validate_format(:email, ~r/@/)
    |> validate_length(:cpf, is: 11)
  end

  defp check_constraints(changeset) do
    changeset
    |> unique_constraint([:email])
    |> unique_constraint([:cpf])
  end
end
