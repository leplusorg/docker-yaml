FROM alpine:3.22.1@sha256:4bcff63911fcb4448bd4fdacec207030997caf25e9bea4045fa6c8c44de311d1

HEALTHCHECK NONE

ENTRYPOINT []

ARG USER_NAME=default
ARG USER_HOME=/home/default
ARG USER_ID=1000
ARG USER_GECOS=Default

SHELL ["/bin/ash", "-euo", "pipefail", "-c"]

# hadolint ignore=DL3019
RUN apk upgrade --no-cache \
    && apk add --no-cache \
    coreutils=9.7-r1 \
    curl=8.14.1-r1 \
    dasel=2.8.1-r6 \
    gawk=5.3.2-r2 \
    git=2.49.1-r0 \
    grep=3.12-r0 \
    jq=1.8.0-r0 \
    npm=11.3.0-r1 \
    pipx=1.7.1-r0 \
    py3-pip=25.1.1-r0 \
    python3=3.12.11-r0 \
    yq-go=4.46.1-r1 \
    && apk cache --no-cache clean \
    && rm -rf /var/cache/apk/*

RUN pipx ensurepath --global \
    && pipx install --global \
    json2yaml==1.2.0 \
    jsonfmt==0.2.7 \
    remarshal==1.2.0 \
    yamllint==1.37.1 \
    yamlpath==3.8.2

RUN npm install -g \
    prettier@3.6.2 \
    v8r@5.1.0

RUN adduser \
  --home "${USER_HOME}" \
  --uid "${USER_ID}" \
  --gecos "${USER_GECOS}" \
  --disabled-password \
  "${USER_NAME}"

USER "${USER_NAME}"

ENV HOME="${USER_HOME}"

WORKDIR "${HOME}"
