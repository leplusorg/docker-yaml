FROM alpine:3.21.0@sha256:e323a465c03a31ad04374fc7239144d0fd4e2b92da6e3e0655580476d3a84621

HEALTHCHECK NONE

ENTRYPOINT []

ARG USER_NAME=default
ARG USER_HOME=/home/default
ARG USER_ID=1000
ARG USER_GECOS=Default

# hadolint ignore=DL3018
RUN apk --update --no-cache add build-base jq python3-dev py3-setuptools py3-pip yamllint \
    && rm -rf /var/cache/apk/*

# hadolint ignore=DL3013
RUN pip3 install --no-cache-dir --upgrade --break-system-packages \
    json2yaml \
    yamlpath \
    yq

RUN adduser \
  --home "${USER_HOME}" \
  --uid "${USER_ID}" \
  --gecos "${USER_GECOS}" \
  --disabled-password \
  "${USER_NAME}"

ENV HOME="${USER_HOME}"

USER "${USER_NAME}"

WORKDIR "${HOME}"
