# Makefile - postsec-docker
#
# Build info for compiling local images of the base
# container, the development container, & the production
# container.

all: base dev prod

# base image
base:
	docker build -t postsec/base .

# for predictability
development: .PHONY
	docker build -t postsec/dev development

production: .PHONY
	docker build -t postsec/prod production

# for simplicity
dev: development
prod: production

.PHONY: