defmodule Historifyapi.BrowserLinkView do
  use Historifyapi.Web, :view

  def render("index.json", %{browser_links: browser_links}) do
    %{data: render_many(browser_links, Historifyapi.BrowserLinkView, "browser_link.json")}
  end

  def render("show.json", %{browser_link: browser_link}) do
    %{data: render_one(browser_link, Historifyapi.BrowserLinkView, "browser_link.json")}
  end

  def render("browser_link.json", %{browser_link: browser_link}) do
    %{id: browser_link.id,
      uri: browser_link.uri,
      uri_keywords: browser_link.uri_keywords,
      description: browser_link.description,
      title: browser_link.title,
      meta_data: browser_link.meta_data,
      visited_at: browser_link.visited_at,
      client: browser_link.client,
      user_id: browser_link.user_id}
  end
end
