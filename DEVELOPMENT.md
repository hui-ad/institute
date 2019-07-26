# Steps

1. Install asdf: https://asdf-vm.com/#/core-manage-asdf-vm
2. Install elixir, erlang, and nodejs plugins for asdf: 
  - https://github.com/asdf-vm/asdf-erlang/
  - https://asdf-vm.com/#/core-manage-asdf-vm
  - https://github.com/asdf-vm/asdf-nodejs
3. Use asdf to install the versions we are using: `asdf install` (from repository root dir)
4. Create a `.env` with all the environment variables we are using (TODO: this needs more instructions)
5. Install a postgres server
6. Maybe install `dotenv` from ruby to load the `.env` file
7. `dotenv mix deps.get`
8. `cd apps/institute; dotenv mix ecto.create`
9. `cd apps/institute; dotenv mix ecto.migrate`
10. `dotenv mix phx.server`
11. Visit http://localhost:4002 and enjoy the site!

Also note that all submitted PR's should follow the code of conduct: https://institute.gigalixirapp.com/code_of_conduct
