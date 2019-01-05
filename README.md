## To do
https://hexdocs.pm/phoenix/testing.html#content

### Local development
docker build -t phoenix_dev --no-cache -f ./Dockerfile_dev .
docker network create phoenix

cd ~/Code/CloudProject/cloud_project_phoenix
docker run --rm --name postgres --network phoenix -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=postgres -e POSTGRES_DB=postgres postgres:alpine

<!-- .hex and .mix folder as volumes only to not have to get dependencies each time -->
docker run --rm -it --user $(id -u):$(id -g) --name phoenix -p 4000:4000 --network phoenix -v $PWD:/d -v $PWD/.mix:/.mix -v $PWD/.hex:/.hex -w /d phoenix_dev sh
cd blog && mix deps.get && mix ecto.setup && mix phx.server

docker exec -ti phoenix sh
cd blog

### Starting new app
```
mkdir .mix .hex
docker run --rm -it --user $(id -u):$(id -g) --name phoenix -p 4000:4000 --network phoenix -v $PWD:/d -v $PWD/.mix:/.mix -v $PWD/.hex:/.hex -w /d phoenix_dev sh
mix local.hex --force
mix archive.install hex phx_new --force
mix phx.new blog --no-webpack --database postgres
cd /d/blog
mix deps.get --force
mix local.rebar --force # for ecto
mix ecto.create # Configure your database in config/dev.exs and run this
mix phx.server

mix phx.gen.html Articles Article articles title:string content:text published:date
mix ecto.migrate
```

#### DB stuff
DB schema generations
```
mix phx.gen.schema Article articles title:string content:text published:date
mix phx.gen.schema Nugget nuggets content:text published:date
```

```
# Interactive shell
iex -S mix
recompile() # when necessary

alias Blog.Article
changeset = Article.changeset(%Article{}, %{})
changeset.errors
changeset.valid?
params = %{title: "First article", content: "Content of first article", published: Date.utc_today() }
changeset = Article.changeset(%Article{}, params)


alias Blog.{Repo, Article}
Repo.insert(%Article{title: "First article", content: "Content of first article", published: Date.utc_today() })
Repo.all(Article)

# Make nice queries
import Ecto.Query
Repo.all(from a in Article, select: a.title)
Repo.one(from a in Article, where: ilike(a.title, "%First%"), select: count(a.id))
Repo.all(from a in Article, select: %{a.id => a.title})
```

### Testing
```
mix test
mix test test/hello_web/views/error_view_test.exs:12 # Run single test starting on line 12
mix test --only error_view_case
mix test --only test_404:first
mix test --exclude error_view_case
# If specific tests fail, but re-run succeeds, dig deeper by running with failing seed
mix test --seed 401472
```


### Update dependencies
Update versions in mix.exs file
```
mix deps.get
mix hex.outdated
```

### Notes
New stuff?
Create controller, view, template, route
```
mix phx.routes
```

```
# iex with phx server running in the background
iex -S mix phx.server
```