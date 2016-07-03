defmodule Historifyapi.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :id, :integer
      add :user_name, :string
      add :password, :string
      add :email, :string
      add :token, :string
      add :role, :string
      add :last_login, :string

      timestamps
    end

  end
end
