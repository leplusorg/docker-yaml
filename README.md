# YAML

Docker container with utilities to process YAML files (yamllint...).

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
