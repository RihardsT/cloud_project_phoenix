# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Blog.Repo.insert!(%Blog.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
import Ecto.Query
alias Blog.{Repo, Articles.Article}

unless(Repo.one(from article in Article, select: count(article.id)) != 0) do
  Repo.insert( Article.changeset( %Article{}, %{title: "First article", content: "Content of first article", published: Date.utc_today()} ))
  Repo.insert( Article.changeset( %Article{} ,%{title: "Second article", content: "Content of second article", published: Date.utc_today()} ))
end
