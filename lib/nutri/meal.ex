defmodule Nutri.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  @required_keys [:description, :date, :calories]

  @derive {Jason.Encoder, only: [:id, :description, :date, :calories]}

  schema "meals" do
    field :description, :string
    field :date, :naive_datetime
    field :calories, :integer

    timestamps()
  end

  def changeset(meal \\ %__MODULE__{}, params) do
    meal
    |> cast(params, @required_keys)
    |> validate_required(@required_keys)
    |> validate_length(:description, greater_than_or_equal_to: 5)
    |> validate_number(:calories, greater_than: 0)
    |> validate_number(:calories, less_than: 2000)
  end
end
