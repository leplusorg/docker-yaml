FROM alpine:3.24.3@sha256:be2656061b536c1883c4034790e21d0a09c5aaaf51968b89368a3c0371ea2c9a

HEALTHCHECK NONE

ENTRYPOINT []

ARG USER_NAME=default
ARG USER_HOME=/home/default
ARG USER_ID=1000
ARG USER_GECOS=Default

SHELL ["/bin/ash", "-euo", "pipefail", "-c"]

RUN apk upgrade --no-cache \
    && apk add --no-cache \
    coreutils=9.11-r0 \
    curl=8.23.0-r0 \
    dasel=2.8.1-r17 \
    gawk=5.3.2-r2 \
    git=2.54.1-r0 \
    grep=3.12-r0 \
    jq=1.8.2-r0 \
    npm=11.12.1-r0 \
    pipx=1.14.0-r0 \
    py3-pip=26.1.2-r0 \
    python3=3.14.10-r1 \
    yq-go=4.53.3-r2 \
    && apk cache --no-cache clean \
    && rm -rf /var/cache/apk/*

COPY requirements.txt /tmp/requirements.txt

# Install each app from requirements.txt in its own venv, using the lines
# marked "constraint" as pip constraints to pin some of their dependencies.
RUN pipx ensurepath --global \
    && sed -n -e 's/#[[:space:]]*constraint[[:space:]]*$//p' /tmp/requirements.txt > /tmp/constraints.txt \
    && sed -e '/#[[:space:]]*constraint[[:space:]]*$/d' -e 's/#.*//' /tmp/requirements.txt \
    | xargs -n 1 pipx install --global --pip-args=--constraint=/tmp/constraints.txt \
    && rm -f /tmp/requirements.txt /tmp/constraints.txt

COPY package.json /tmp/package.json

RUN jq -r '.dependencies | to_entries[] | "\(.key)@\(.value)"' /tmp/package.json \
    | xargs -n 1 npm install -g \
    && rm -f /tmp/package.json

RUN adduser \
  --home "${USER_HOME}" \
  --uid "${USER_ID}" \
  --gecos "${USER_GECOS}" \
  --disabled-password \
  "${USER_NAME}"

USER "${USER_NAME}"

ENV HOME="${USER_HOME}"

WORKDIR "${HOME}"
