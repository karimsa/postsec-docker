# postsec-docker

Docker image definitions for the Post-Secondary Database Registration
application.

## Environment

 - OS: Ubuntu Xenial (16.04)
 - Apache vXXX
 - PHP vXXX
 - MySQL vXXX

## Available images

 - [`postsec/base`](Dockerfile): base image that provides prerequisites.
 - [`postsec/dev`](development/Dockerfile): extends base image and sets up development environment.
 - [`postsec/prod`](production/Dockerfile): extends base image and sets up production environment.

## Development Environment

 - Defines public directory as a *volume* so that it is container-specific and not image-specific.

## Production Environment

 - Defines public directory as a directory copied from host to image.