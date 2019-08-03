# Steps

1. Install asdf: https://asdf-vm.com/#/core-manage-asdf-vm
2. Install Erlang, Elixir and NodeJS plugins for asdf: 
  - https://github.com/asdf-vm/asdf-erlang/
  - https://github.com/asdf-vm/asdf-elixir
  - https://github.com/asdf-vm/asdf-nodejs
3. Use asdf to install the versions we are using: `asdf install` (from repository root dir)
  - May need to `asdf reshim` if previous versions were in installed
4. Setup environment variables
  - Create a `.env` with all the environment variables we are using (TODO: this needs more instructions)
  - OR, install `dotenv` from ruby to load the `.env` file
5. Install a postgres server
6. Install dependencies
  - Without dotenv `mix deps.get`
  - Via dotenv `dotenv mix deps.get`
7. Setup tables and data
  - Without dotenv:
    - `cd apps/institute; mix ecto.reset`
  - Via dotenv:
    - `cd apps/institute; dotenv mix ecto.create`
    -  `cd apps/institute; dotenv mix ecto.migrate`
10. Start Phoenix
  - Without dotenv: `cd path/to/project/root; mix phx.server`
  - Via dotenv: `cd path/to/project/root; dotenv mix phx.server`
11. Visit http://localhost:4002 and enjoy the site!

Also note that all submitted PR's should follow the code of conduct: https://institute.gigalixirapp.com/code_of_conduct
