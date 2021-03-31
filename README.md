# Rocket Seat Ignite - Nutri

## Table of Contents

- [About](#about)
- [Endpoints](#endpoints)
- [Setup](#setup)
- [Bash Commands](#bash_commands)
- [Elixir Commands](#elixir_commands)
- [Libs](#libs)
- [Docs](#docs)
- [Resources](#resources)

## About <a name = "about"></a>

A calories counter backend made with Phoenix.

## Endpoints <a name = "endpoints"></a>

Built-in:

- `GET` http://localhost:4000/dashboard

`Meals`

- `GET` http://localhost:4000/api/meals
- `GET` http://localhost:4000/api/meals/:id
- `POST` http://localhost:4000/api/meals
- `PUT` http://localhost:4000/api/meals/:id
- `DELETE` http://localhost:4000/api/meals/:id

## Setup <a name = "setup"></a>

Install `Erlang`, `Elixir` and `Phoenix`.

### Postgres

Create a postgress docker container with:

```bash
$ docker run --name postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres
```

## Bash Commands <a name = "bash_commands"></a>

```bash
# Create phoenix app without webpacker or html views
$ mix phx.new app_name --no-webpack --no-html

# Intall dependencies
$ mix deps.get

# Compile project
$ mix compile

# Generate linter config file
$ mix credo.gen.config

# Run linter
$ mix credo --strict

# Start Phoenix dev server on http://localhost:4000
$ mix phx.server

# Start your project as an Interactive Elixir session
$ iex -S mix

# List all configured routes
$ mix phx.routes
```

Ecto:

```bash
# Create and migrate database
$ mix ecto.setup

# Create a migration
$ mix ecto.gen.migration create_users_table

# Run pending migrations
$ mix ecto.migrate

# Drop and migrate databases
$ mix ecto.reset

# Drop databases
$ mix ecto.drop

# Create databases
$ mix ecto.create
```

Tests

```bash
# Run tests
$ mix test

# Run tests w/ coverage report
$ mix test --cover
```

## Elixir Commands <a name = "elixir_commands"></a>

Create a meal:

```elixir
> meal_params = %{
  description: "Royal with cheese",
  date: "1994-05-21 12:00:00",
  calories: 500
}
> Nutri.Meals.Create.call(meal_params)
```

Fetch meals:

```elixir
> Nutri.Repo.all(Nutri.Meal)
> Nutri.Repo.get(Nutri.Meal, 1)

> Nutri.get_meals()
> Nutri.get_meal_by_id(1)
```

Update meal:

```elixir
> new_meal_params = %{
  "id" => 1,
  "description" => "UPDATEDDDDDDD",
  "date" => "2021-03-24 12:00:00",
  "calories" => 1000
}
> Nutri.Meals.Update.call(new_meal_params)
```

Delete meal:

```elixir
> Nutri.delete_meal(1)
```

## Libs <a name = "libs"></a>

- https://github.com/phoenixframework/phoenix

## Docs <a name = "docs"></a>

- https://elixir-lang.org/crash-course.html
- https://hexdocs.pm/ecto/Ecto.Changeset.html#validate_number/3
- https://hexdocs.pm/ecto_sql/Ecto.Migration.html#alter/2

## Resources <a name = "resources"></a>

- https://www.tutorialspoint.com/elixir/elixir_lists_and_tuples.htm
