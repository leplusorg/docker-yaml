FROM alpine:latest

RUN apk --update --no-cache add py3-setuptools \
    && rm -rf /var/cache/apk/*

RUN pip3 install --no-cache-dir yamllint
