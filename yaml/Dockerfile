FROM alpine:3.19.1@sha256:c5b1261d6d3e43071626931fc004f70149baeba2c8ec672bd4f27761f8e1ad6b

HEALTHCHECK NONE

ENTRYPOINT []

# hadolint ignore=DL3018
RUN apk --update --no-cache add build-base python3-dev py3-setuptools py3-pip yamllint \
    && rm -rf /var/cache/apk/*

# hadolint ignore=DL3013
RUN pip3 install --no-cache-dir --upgrade --break-system-packages \
    jq \
    json2yaml \
    yamlpath \
    yq

ARG USER=default

ENV HOME "/home/${USER}"

RUN adduser -D "${USER}"

USER "${USER}"

WORKDIR "${HOME}"
