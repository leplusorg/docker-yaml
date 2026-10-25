# YAML image

Build context for the `leplusorg/yaml` container image. See the
[root readme](../README.md) for what the image does and how to run it.

## Files

- `Dockerfile` — the image definition. System packages come from the base
  distribution's package manager and are pinned to exact versions here.
- `docker-compose.test.yml` — the smoke test run in CI against the built image:
  the `sut` service checks that the container runs as the non-root user (UID 1000) and that each bundled tool starts.
- `requirements.txt` — the Python tools installed in the image, with their
  pinned versions. The `Dockerfile` installs each one globally with `pipx`, in
  its own virtual environment.
- `package.json` — the Node.js tools installed in the image, with their pinned
  versions. The `Dockerfile` installs each entry of `dependencies` globally with
  `npm install -g`.
- `package-lock.json` — the full npm dependency tree resolved from
  `package.json`, including transitive dependencies. It is not used by the image
  build, so the transitive versions actually installed in the image can differ
  from the ones recorded here.
- `node_modules/` — created by a local `npm install`; ignored by Git and not
  part of the image.

## Manifests

The manifests (`requirements.txt`, `package.json`) expose the pinned versions of
some of the packages and tools included in the image in a machine-readable
format. They can be used to generate an SBOM, and they are kept up to date
automatically by Dependabot (see [`dependabot.yml`](../.github/dependabot.yml));
Renovate would work too.
