# YAML

Docker container with utilities to process YAML files (yamllint...).

![Docker Stars](https://img.shields.io/docker/stars/thomasleplus/yaml.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/thomasleplus/yaml.svg)
![Docker Automated](https://img.shields.io/docker/automated/thomasleplus/yaml.svg)
![Docker Build](https://img.shields.io/docker/build/thomasleplus/yaml.svg)

## Example not using the filesystem

Let's say that you have a file `foo.yml` in your current working directory that you want to validate:

### Mac/Linux

```
cat foo.yml | docker run --rm -i --net=none thomasleplus/yaml yamllint -
```

### Windows

```
type foo.yml | docker run --rm -i --net=none thomasleplus/yaml yamllint -
```

## Example using the filesystem

Same thing, assuming that you have a file `foo.yml` in your current working directory that you want to validate:

### Mac/Linux

```
docker run --rm -t --user="$(id -u):$(id -g)" --net=none -v "$(pwd):/tmp" thomasleplus/yaml yamllint /tmp/foo.yml
```

### Windows

In `cmd`:

```
docker run --rm -t --net=none -v "%cd%:/tmp" thomasleplus/yaml yamllint /tmp/foo.yml
```

In PowerShell:

```
docker run --rm -t --net=none -v "${PWD}:/tmp" thomasleplus/yaml yamllint /tmp/foo.yml
```

## Help

To know more command line options of `yamllint`:

```
docker run --rm --net=none thomasleplus/yaml yamllint -h
```

## Request new tool

Please use [this link](https://github.com/thomasleplus/docker-yaml/issues/new?assignees=thomasleplus&labels=enhancement&template=feature_request.md&title=%5BFEAT%5D) (GitHub account required) to request that a new tool be added to the image. I am always interested in adding new capabilities to these images.
