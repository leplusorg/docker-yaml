FROM alpine:3.23.2@sha256:865b95f46d98cf867a156fe4a135ad3fe50d2056aa3f25ed31662dff6da4eb62

HEALTHCHECK NONE

ENTRYPOINT []

ARG USER_NAME=default
ARG USER_HOME=/home/default
ARG USER_ID=1000
ARG USER_GECOS=Default

SHELL ["/bin/ash", "-euo", "pipefail", "-c"]

RUN apk upgrade --no-cache \
    && apk add --no-cache \
    coreutils=9.8-r1 \
    curl=8.17.0-r1 \
    dasel=2.8.1-r11 \
    gawk=5.3.2-r2 \
    git=2.52.0-r0 \
    grep=3.12-r0 \
    jq=1.8.1-r0 \
    npm=11.6.3-r0 \
    pipx=1.8.0-r0 \
    py3-pip=25.1.1-r1 \
    python3=3.12.12-r0 \
    yq-go=4.49.2-r3 \
    && apk cache --no-cache clean \
    && rm -rf /var/cache/apk/*

COPY requirements.txt /tmp/requirements.txt

RUN pipx ensurepath --global \
    && xargs -a /tmp/requirements.txt -n 1 pipx install --global \
    && rm -f /tmp/requirements.txt

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
