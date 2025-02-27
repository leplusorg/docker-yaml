# YAML

Docker container with utilities to process YAML files (yamllint...).

[![Dockerfile](https://img.shields.io/badge/GitHub-Dockerfile-blue)](https://github.com/leplusorg/docker-yaml/blob/main/yaml/Dockerfile)
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

## Software Bill of Materials (SBOM)

To get the SBOM for the latest image (in SPDX JSON format), use the
following command:

```bash
docker buildx imagetools inspect leplusorg/yaml --format '{{ json (index .SBOM "linux/amd64").SPDX }}'
```

Replace `linux/amd64` by the desired platform (`linux/amd64`, `linux/arm64` etc.).

## Request new tool

Please use [this link](https://github.com/leplusorg/docker-yaml/issues/new?assignees=thomasleplus&labels=enhancement&template=feature_request.md&title=%5BFEAT%5D) (GitHub account required) to request that a new tool be added to the image. I am always interested in adding new capabilities to these images.
