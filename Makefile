.PHONY: deploy
deploy:
	git push gigalixir master

.PHONY: deploy-dev
deploy-dev:
	git push gigalixir development:master

.PHONY: migrate
migrate:
	gigalixir ps:migrate --migration_app_name institute

.PHONY: deploy-clean
deploy-clean:
	git -c http.extraheader="GIGALIXIR-CLEAN: true" push gigalixir master

# Remove unused deps from mix.lock file
.PHONY: mix-deps-unlock-unused
mix-deps-unlock-unused:
	mix deps.unlock --unused

.PHONY: empty-commit
empty-commit:
	git commit --allow-empty -m "Trigger Gigalixir deploy"

.PHONY: empty-deploy
empty-deploy: empty-commit deploy
	echo "Pushed empty deployment to Gigalixir"

.PHONY: editor
editor:
	source .env; code .
