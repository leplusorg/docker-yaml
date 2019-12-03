# YAML

Docker container with utilities to process YAML files (yamllint...).

## Example

Assuming that you have a file `foo.yaml` in your current working directory:

### Mac/Linux

```
$ docker run --rm -it --user="$(id -u):$(id -g)" --net=none -v "$(pwd):/tmp" thomasleplus/yaml yamllint /tmp/foo.yaml
```

### Windows

In `cmd`:

```
$ docker run --rm -it --net=none -v "%cd%:/tmp" thomasleplus/yaml yamllint /tmp/foo.yaml
```

In PowerShell:

```
$ docker run --rm -it --net=none -v "${PWD}:/tmp" thomasleplus/yaml yamllint /tmp/foo.yaml
```

## Help

To know more command line options of `yamllint`:

```
$ docker run --rm -it --net=none thomasleplus/yaml yamllint -h
```
