# postsec-docker

Docker image definitions for the Post-Secondary Database Registration
application.

 - [Environment](#environment)
  - [Development Environment](#development-environment)
  - [Production Environment](#production-environment)
 - [Available images](#available-images)
 - [Usage](#usage)

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

## Usage

These images are not currently part of any docker registry - neither public nor private. Due to
this, you will have to compile the images locally. The process is not much different but slightly
slower.

### Prerequisites

 - Docker (any version - probably)
 - `make` (any version)

### Building

 - To build all images, just run `make` or `make all`.
 - To build the base image, run `make base`.
 - To build the development image, run `make development` or `make dev`.
 - To build the production image, run `make production` or `make prod`.

### Running

For both versions, you will need to have a port free on the host computer to use for
hosting the application. Within the container, apache will be running on port 80. For
the purposes of this README, I will assume that your host port is 8080.

**Development version**

The development version requires you to mount the local application directory
to `/var/www/html`. For the purposes of this README, let's assume that your application
is stored locally at `/app`.

*Start in detached mode (container will run in background).*

```
$ docker run -d -v /app:/var/www/html -p 8080:80 postsec/dev
```

*Start in interactive foreground mode (Ctrl+C will close the server & logs will be displayed).*

```
$ docker run -it -v /app:/var/www/html -p 8080:80 postsec/dev
```

**Production version**

The production version requires you to copy the application over to `production/www`
before compiling the image. Sample build process:

```
$ rm -rf production/www
$ cp -R /app production/www
$ make prod
```

*Start in detached mode (container will run in background).*

```
$ docker run -d -p 8080:80 postsec/prod
```

*Start in interactive foreground mode (Ctrl+C will close the server & logs will be displayed).*

```
$ docker run -it -p 8080:80 postsec/prod
```