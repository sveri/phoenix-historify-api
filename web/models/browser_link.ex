defmodule Historifyapi.BrowserLink do
  use Historifyapi.Web, :model

  schema "browser_link" do
    field :uri, :string
    field :uri_keywords, :string
    field :description, :string
    field :title, :string
    field :meta_data, :string
    field :visited_at, Ecto.DateTime
    field :client, :string
    belongs_to :user, Historifyapi.User

    #timestamps
  end

  @required_fields ~w(id uri uri_keywords description title meta_data visited_at client)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
