defmodule Historifyapi.UserTest do
  use Historifyapi.ModelCase

  alias Historifyapi.User

  @valid_attrs %{email: "some content", id: 42, last_login: "some content", password: "some content", role: "some content", token: "some content", user_name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
