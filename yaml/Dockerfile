FROM alpine:latest

ENV YQ_VERSION=2.4.1

RUN apk --update --no-cache add py3-setuptools \
    && rm -rf /var/cache/apk/*

RUN pip3 install --no-cache-dir \
    json2yaml \
    yamllint \
    yamlpath
    
RUN wget -O /usr/bin/yq "https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64"
