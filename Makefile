BLOG_REPO_DIR := ../yuriyfilonov.github.io


.PHONY: help
help:
	@cat $(MAKEFILE_LIST) \
		| grep -e "^[a-zA-Z0-9_\-]*: *.*## *" \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install: ## Install gems
	bundle

build: ## Build static files
	bundle exec jekyll build

server: ## Server blog locally
	bundle exec jekyll server

deploy: ## Copy static files to a blog repo directory (requires message parameter to be initialized)
	@[ "${message}" ] || ( echo "Commit message has to be provided"; exit 1 )
	cp -r _site/* $(BLOG_REPO_DIR)
	git --git-dir $(BLOG_REPO_DIR)/.git add .
	git --git-dir $(BLOG_REPO_DIR)/.git commit -m "$(message)"
	git --git-dir $(BLOG_REPO_DIR)/.git push
