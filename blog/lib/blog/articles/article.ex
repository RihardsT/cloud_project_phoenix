defmodule Blog.Articles.Article do
  use Ecto.Schema
  import Ecto.Changeset


  schema "articles" do
    field :content, :string
    field :published, :date
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(article, attrs) do
    article
    |> cast(attrs, [:title, :content, :published])
    |> validate_required([:title, :content, :published])
  end
end
