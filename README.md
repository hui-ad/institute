# Institute

## Prerequisites

Before you do anything, you'll need these prerequisites:

* You'll need Erlang, Elixir, and Node installed. If you don't have them installed already, I recommend using `asdf` to install them. `asdf` allows you to manage multiple versions of each of these requirements on your machine.
  * Here's an [ElixirCast on installing Elixir (and Erlang) with asdf](https://elixircasts.io/installing-elixir-with-asdf)
  * Here's the main [docs for asdf](https://asdf-vm.com/#/)
  * [Elixir install via `asdf` docs](https://github.com/asdf-vm/asdf-elixir)
    * If this doesn't work for you, some have had success installing Elixir from Homebrew.
  * [NodeJS install via `asdf` docs](https://github.com/asdf-vm/asdf-nodejs)
* You'll need Postgres installed. See the `.env.template` file for the default role/password used by this application. You can change the connection string in `.env` or create the required user. It's likely you already have a Postgres role set up.
  * If you're using a Mac, I recommend the [Postgres.app for Mac](https://postgresapp.com/) application.

## Starting Phoenix

To start your Phoenix server:
    
* Create `.env` file from `.env.template`
* Source env vars with `source .env`
* Install dependencies with `mix deps.get`
* Create and migrate your database with `mix ecto.setup`
  * If you see an error such as `** (Postgrex.Error) FATAL 28000 (invalid_authorization_specification) role "postgres" is not permitted to log in` check the that your role and password match what is in `.env`
  * If you see an error such as `** (Mix) The database for Institute.Repo couldn't be created: ERROR 42501 (insufficient_privilege) permission denied to create database` make sure you have the following privs:
    * `grant all privileges on database institute_dev to postgres;`
    * `grant all privileges on database institute_test to postgres;`
* Install Node.js dependencies with `cd assets && npm install`
* Start Phoenix endpoint with `mix phx.server`
  * If you see an error such as `[error] Can't find executable `mac_listener`` it's safe to ignore it. But, you won't be able to use live reload. You'll have to reload your browser manually after you make code changes.
    * To fix this run `open /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg` (as of 7/2019)

Now you can visit [`localhost:4002`](http://localhost:4002) from your browser.

## Gigalixir

To use Gigalixir's CLI, 
* Push with `git push gigalixir master`
* View logs with `gigalixir logs`
* Add keys (for migrations and console) with `gigalixir account:ssh_keys:add "$(cat ~/.ssh/id_rsa.pub)"`
  * In Fish Shell use `gigalixir account:ssh_keys:add (cat ~/.ssh/id_rsa.pub)`
* Run migrations with `gigalixir ps:migrate`
* Drop into console with `gigalixir ps:remote_console`

## User Creation

Any registered user can create new users using the "Create user" link in the navigation bar. It only shows up when you're logged in, you'll need to create the first user via IEx.

* Start `iex` from the command line: `iex`
* Set alias: `alias Institute.Accounts`
* Create user `Accounts.register_user(%{name: "John Doe", username: "john", password: "secret"})`

To change a user's password:

* Start `iex` from the command line: `iex`
* Set aliases: `alias Institute.{Accounts, Repo}`
* Retrieve user `u = Accounts.get_user_by(%{username: "john"})`
* Set password `Repo.update!(User.registration_changeset(u, %{password: "secret"}))`
