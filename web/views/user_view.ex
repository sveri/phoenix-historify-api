defmodule Historifyapi.UserView do
  use Historifyapi.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, Historifyapi.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, Historifyapi.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      id: user.id,
      user_name: user.user_name,
      password: user.password,
      email: user.email,
      token: user.token,
      role: user.role,
      last_login: user.last_login}
  end
end
