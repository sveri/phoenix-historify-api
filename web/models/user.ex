defmodule Historifyapi.User do
  use Historifyapi.Web, :model

  schema "users" do
    field :user_name, :string
    field :password, :string
    field :email, :string
    field :token, :string
    field :role, :string
    field :last_login, :string

    timestamps
  end

  @required_fields ~w(id user_name password email token role last_login)
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
