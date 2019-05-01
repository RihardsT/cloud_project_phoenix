defmodule BlogWeb.PageControllerTest do
  use BlogWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Rudens"
  end

  test "GET /articles", %{conn: conn} do
    conn = get(conn, Routes.article_path(conn, :index))
    assert html_response(conn, 200)
  end

  test "Test that main page contains link to articles ", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ ~r|href="/articles"|
    # quite dumb way to check match that url exists in root page
    # Issue: this regex also matches /articles/:id, or :show path.
    # TODO improve the regex to properly match only :index
  end

end
