defmodule Historifyapi.BrowserLinkController do
  use Historifyapi.Web, :controller

  alias Historifyapi.BrowserLink

#  plug :scrub_params, "browser_link" when action in [:create, :update]

  def index(conn, _params) do
    browser_links = Repo.all(BrowserLink)
    render conn, browser_links: browser_links
  end



#    use HelloPhoenix.Web, :controller
#      alias HelloPhoenix.Repo
#      alias HelloPhoenix.Contact
#
#      plug :action
#

#  def index(conn, _params) do
#    browser_links = Repo.all(BrowserLink)
#    render(conn, "index.json", browser_links: browser_links)
#  end
#
#  def create(conn, %{"browser_link" => browser_link_params}) do
#    changeset = BrowserLink.changeset(%BrowserLink{}, browser_link_params)
#
#    case Repo.insert(changeset) do
#      {:ok, browser_link} ->
#        conn
#        |> put_status(:created)
#        |> put_resp_header("location", browser_link_path(conn, :show, browser_link))
#        |> render("show.json", browser_link: browser_link)
#      {:error, changeset} ->
#        conn
#        |> put_status(:unprocessable_entity)
#        |> render(Historifyapi.ChangesetView, "error.json", changeset: changeset)
#    end
#  end
#
#  def show(conn, %{"id" => id}) do
#    browser_link = Repo.get!(BrowserLink, id)
#    render(conn, "show.json", browser_link: browser_link)
#  end
#
#  def update(conn, %{"id" => id, "browser_link" => browser_link_params}) do
#    browser_link = Repo.get!(BrowserLink, id)
#    changeset = BrowserLink.changeset(browser_link, browser_link_params)
#
#    case Repo.update(changeset) do
#      {:ok, browser_link} ->
#        render(conn, "show.json", browser_link: browser_link)
#      {:error, changeset} ->
#        conn
#        |> put_status(:unprocessable_entity)
#        |> render(Historifyapi.ChangesetView, "error.json", changeset: changeset)
#    end
#  end
#
#  def delete(conn, %{"id" => id}) do
#    browser_link = Repo.get!(BrowserLink, id)
#
#    # Here we use delete! (with a bang) because we expect
#    # it to always work (and if it does not, it will raise).
#    Repo.delete!(browser_link)
#
#    send_resp(conn, :no_content, "")
#  end
end
