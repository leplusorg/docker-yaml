FROM alpine:3.17.0

# hadolint ignore=DL3018
RUN apk --update --no-cache add build-base python3-dev py3-setuptools py3-pip \
    && rm -rf /var/cache/apk/*

# hadolint ignore=DL3013
RUN pip3 install --no-cache-dir --upgrade \
    json2yaml \
    yamllint \
    yamlpath \
    yq
