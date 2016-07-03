defmodule Historifyapi.Repo.Migrations.CreateBrowserLink do
  use Ecto.Migration

  def change do
    create table(:browser_links) do
      add :id, :integer
      add :uri, :string
      add :uri_keywords, :string
      add :description, :string
      add :title, :string
      add :meta_data, :string
      add :visited_at, :datetime
      add :client, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps
    end
    create index(:browser_links, [:user_id])

  end
end
