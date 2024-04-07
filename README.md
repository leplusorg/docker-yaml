# YAML

Docker container with utilities to process YAML files (yamllint...).

[![Docker Build](https://github.com/leplusorg/docker-yaml/workflows/Docker/badge.svg)](https://github.com/leplusorg/docker-yaml/actions?query=workflow:"Docker")
[![Docker Stars](https://img.shields.io/docker/stars/leplusorg/yaml)](https://hub.docker.com/r/leplusorg/yaml)
[![Docker Pulls](https://img.shields.io/docker/pulls/leplusorg/yaml)](https://hub.docker.com/r/leplusorg/yaml)
[![Docker Version](https://img.shields.io/docker/v/leplusorg/yaml?sort=semver)](https://hub.docker.com/r/leplusorg/yaml)

## Example not using the filesystem

Let's say that you have a file `foo.yml` in your current working directory that you want to validate:

**Mac/Linux**

```bash
cat foo.yml | docker run --rm -i --net=none leplusorg/yaml yamllint -
```

**Windows**

```batch
type foo.yml | docker run --rm -i --net=none leplusorg/yaml yamllint -
```

## Example using the filesystem

Same thing, assuming that you have a file `foo.yml` in your current working directory that you want to validate:

**Mac/Linux**

```bash
docker run --rm -t --user="$(id -u):$(id -g)" --net=none -v "$(pwd):/tmp" leplusorg/yaml yamllint /tmp/foo.yml
```

**Windows**

In `cmd`:

```batch
docker run --rm -t --net=none -v "%cd%:/tmp" leplusorg/yaml yamllint /tmp/foo.yml
```

In PowerShell:

```pwsh
docker run --rm -t --net=none -v "${PWD}:/tmp" leplusorg/yaml yamllint /tmp/foo.yml
```

## Help

To know more command-line options of `yamllint`:

```bash
docker run --rm --net=none leplusorg/yaml yamllint -h
```

## Request new tool

Please use [this link](https://github.com/leplusorg/docker-yaml/issues/new?assignees=thomasleplus&labels=enhancement&template=feature_request.md&title=%5BFEAT%5D) (GitHub account required) to request that a new tool be added to the image. I am always interested in adding new capabilities to these images.
