# Supported tags and respective `Dockerfile` links

-	[`latest`, `3.7.0` (*Dockerfile*)](https://github.com/masahide/docker-tox/blob/latest/Dockerfile)

[![Build Status](https://travis-ci.org/masahide/docker-tox.svg?branch=master)](https://travis-ci.org/masahide/docker-tox) [![Docker Pulls](https://img.shields.io/docker/pulls/masahide/tox.svg)](https://hub.docker.com/r/masahide/tox/)

# What is Tox?

Tox is a generic virtualenv management and test command line tool you can use for:

-   checking your package installs correctly with different Python versions and interpreters
-   running your tests in each of the environments, configuring your test tool of choice
-   acting as a frontend to Continuous Integration servers, greatly reducing boilerplate and merging CI and shell-based testing.

> [wikipedia.org/wiki/Tox (Python testing wrapper)](https://en.wikipedia.org/wiki/Tox_%28Python_testing_wrapper%29)

# How to use this image.

### Create a `Dockerfile` in your project

```dockerfile
FROM masahide/tox
```

Then, run the commands to build and run the Docker image:

```console
$ docker build -t my-tox .
$ docker run -it --rm -v "$PWD:/code" my-tox tox
```

### Without a `Dockerfile`

If you don't want to include a `Dockerfile` in your project, it is sufficient to do the following:

```console
$ docker run -it --rm -v "$PWD:/code" -w /code masahide/tox tox
```

# License

View [license information](https://github.com/tox-dev/tox/blob/master/LICENSE) for the software contained in this image.

# Supported Docker versions

This image is officially supported on Docker version 1.10.1.
