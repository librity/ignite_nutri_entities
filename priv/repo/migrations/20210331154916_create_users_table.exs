defmodule Nutri.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table :users do
      add :name, :string
      add :email, :string
      add :cpf, :string

      timestamps()
    end

    create unique_index(:users, [:email])
    create unique_index(:users, [:cpf])
  end
end
