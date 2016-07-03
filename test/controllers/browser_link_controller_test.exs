defmodule Historifyapi.BrowserLinkControllerTest do
  use Historifyapi.ConnCase

  alias Historifyapi.BrowserLink
  @valid_attrs %{client: "some content", description: "some content", id: 42, meta_data: "some content", title: "some content", uri: "some content", uri_keywords: "some content", visited_at: "2010-04-17 14:00:00"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, browser_link_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    browser_link = Repo.insert! %BrowserLink{}
    conn = get conn, browser_link_path(conn, :show, browser_link)
    assert json_response(conn, 200)["data"] == %{"id" => browser_link.id,
      "id" => browser_link.id,
      "uri" => browser_link.uri,
      "uri_keywords" => browser_link.uri_keywords,
      "description" => browser_link.description,
      "title" => browser_link.title,
      "meta_data" => browser_link.meta_data,
      "visited_at" => browser_link.visited_at,
      "client" => browser_link.client,
      "user_id" => browser_link.user_id}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, browser_link_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, browser_link_path(conn, :create), browser_link: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(BrowserLink, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, browser_link_path(conn, :create), browser_link: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    browser_link = Repo.insert! %BrowserLink{}
    conn = put conn, browser_link_path(conn, :update, browser_link), browser_link: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(BrowserLink, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    browser_link = Repo.insert! %BrowserLink{}
    conn = put conn, browser_link_path(conn, :update, browser_link), browser_link: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    browser_link = Repo.insert! %BrowserLink{}
    conn = delete conn, browser_link_path(conn, :delete, browser_link)
    assert response(conn, 204)
    refute Repo.get(BrowserLink, browser_link.id)
  end
end
