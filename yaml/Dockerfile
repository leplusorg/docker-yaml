FROM alpine:3.21.3@sha256:a8560b36e8b8210634f77d9f7f9efd7ffa463e380b75e2e74aff4511df3ef88c

HEALTHCHECK NONE

ENTRYPOINT []

ARG USER_NAME=default
ARG USER_HOME=/home/default
ARG USER_ID=1000
ARG USER_GECOS=Default

# hadolint ignore=DL3018
RUN apk --update --no-cache add build-base jq python3-dev py3-setuptools py3-pip \
    && rm -rf /var/cache/apk/*

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

RUN pip3 install --no-cache-dir --upgrade --break-system-packages \
    json2yaml==1.2.0 \
    yamllint==1.36.0 \
    yamlpath==3.8.2 \
    yq==3.4.3 \
    && msg="$(pip list --outdated | grep -i -e json2yaml -e yamllint -e yamlpath -e yq || true)" \
    && if [ -n "${msg}" ]; then \
       >&2 echo "ERROR: outdated: ${msg}" ; \
       exit 1 ; \
    fi

RUN adduser \
  --home "${USER_HOME}" \
  --uid "${USER_ID}" \
  --gecos "${USER_GECOS}" \
  --disabled-password \
  "${USER_NAME}"

ENV HOME="${USER_HOME}"

USER "${USER_NAME}"

WORKDIR "${HOME}"
