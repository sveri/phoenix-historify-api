defmodule Historifyapi.BrowserLinkTest do
  use Historifyapi.ModelCase

  alias Historifyapi.BrowserLink

  @valid_attrs %{client: "some content", description: "some content", id: 42, meta_data: "some content", title: "some content", uri: "some content", uri_keywords: "some content", visited_at: "2010-04-17 14:00:00"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = BrowserLink.changeset(%BrowserLink{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = BrowserLink.changeset(%BrowserLink{}, @invalid_attrs)
    refute changeset.valid?
  end
end
