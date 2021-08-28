FROM alpine:latest

RUN apk --update --no-cache add py3-setuptools py3-pip \
    && rm -rf /var/cache/apk/*

RUN pip3 install --no-cache-dir \
    json2yaml \
    yamllint \
    yamlpath \
    yq
