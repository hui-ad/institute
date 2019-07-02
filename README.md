# Institute

To start your Phoenix server:
    
* Create `.env` file from `.env.template` (requires changes to contents)
* Source env vars with `source .env`
* Install dependencies with `mix deps.get`
* Create and migrate your database with `mix ecto.setup`
* Install Node.js dependencies with `cd assets && npm install`
* Start Phoenix endpoint with `mix phx.server`

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

* Set alias:
  * `alias Institute.Accounts`
* Create user `Accounts.register_user(%{name: "John Doe", username: "john", password: "secret"})`

To change a user's password:

* Set aliases: 
  * `alias Institute.{Accounts, Repo}`
* Retrieve user `u = Accounts.get_user_by(%{username: "john"})`
* Set password `Repo.update!(User.registration_changeset(u, %{password: "secret"}))`
