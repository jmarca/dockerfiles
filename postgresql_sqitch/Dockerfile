#
# Based on https://github.com/walm/docker-pgtap/blob/master/Dockerfile
#
FROM postgres:latest
MAINTAINER James Marca <james@activimetrics.com>

RUN apk update \
    && apk upgrade \
    && apk add --no-cache --virtual .build-deps \
        perl curl tar make gcc build-base make perl-utils wget gnupg git perl-dev postgis postgis-dev\
    && curl- LO https://raw.githubusercontent.com/miyagawa/cpanminus/master/cpanm \
    && chmod +x cpanm \
    && ./cpanm App::cpanminus \
    && ./cpanm -v Module::Build \
    && ./cpanm -v TAP::Parser::SourceHandler::pgTAP \
    && rm -fr ./cpanm /root/.cpanm /usr/src/perl \
    && git clone --depth 1 git://github.com/theory/pgtap.git \
    && cd pgtap \
    && make \
    && make install \
    && apk del .build-deps
