# postsec-docker

Docker image definitions for the Post-Secondary Database Registration
application.

 - [Environment](#environment)
  - [Development Environment](#development-environment)
  - [Production Environment](#production-environment)
 - [Available images](#available-images)

## Environment

 - OS: Ubuntu Xenial (16.04)
 - Apache / v2.4.18
 - PHP / v5.6.31-1
 - MariaDB / v10.1.25

### Development Environment

 - Defines public directory as a *volume* so that it is container-specific and not image-specific.

### Production Environment

 - Defines public directory as a directory copied from host to image.

## Available images

 - [`postsec/base`](Dockerfile): base image that provides prerequisites.
 - [`postsec/dev`](development/Dockerfile): extends base image and sets up development environment.
 - [`postsec/prod`](production/Dockerfile): extends base image and sets up production environment.