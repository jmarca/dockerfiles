#
# Based on https://github.com/walm/docker-pgtap/blob/master/Dockerfile
#
FROM postgres:alpine
MAINTAINER James Marca <james@activimetrics.com>

RUN apk update \
    && apk upgrade \
    && apk add --no-cache --virtual .build-deps \
        postgresql perl curl tar make gcc cmake build-base make perl-utils wget gnupg git perl-dev\
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    && curl -LO https://raw.githubusercontent.com/miyagawa/cpanminus/master/cpanm \
    && chmod +x cpanm \
    && ./cpanm App::cpanminus \
    && ./cpanm -v Module::Build \
    && ./cpanm -v TAP::Parser::SourceHandler::pgTAP \
    && rm -fr ./cpanm /root/.cpanm /usr/src/perl \
    && git clone --depth 1 git://github.com/theory/pgtap.git \
    && cd pgtap \
    && make \
    && make install
