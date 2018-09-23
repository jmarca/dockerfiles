FROM ruby:alpine3.7 as builder
LABEL maintainer "James Marca <james@activimetrics.com>"

ENV LANG "en_US.UTF-8"
ENV LANGUAGE "en_US.UTF-8"
ENV TERM "xterm"


# Create user and change ownership
RUN  mkdir -p /opt/jekyll \
        && addgroup -g 666 -S jekyll \
	&& adduser -u 666 -SHG jekyll jekyll \
	&& mkdir -p /config \
	&& chown -R jekyll:jekyll /opt/jekyll /config
ENV GEM_HOME=/opt/jekyll/gems
ENV JEKYLL_HOME=/opt/jekyll
ENV JEKYLL_BIN=$JEKYLL_HOME/bin
ENV PATH="$JEKYLL_BIN:$GEM_HOME/bin:$PATH"ENV PATH="$JEKYLL_BIN:$PATH"


# ENV JEKYLL_VAR_DIR=/var/jekyll
# ENV JEKYLL_DOCKER_TAG=<%= @meta.tag %>
# ENV JEKYLL_VERSION=<%= @meta.release?? @meta.release : @meta.tag %>
# ENV JEKYLL_DOCKER_COMMIT=<%= `git rev-parse --verify HEAD`.strip %>
# ENV JEKYLL_DOCKER_NAME=<%= @meta.name %>
# ENV JEKYLL_DATA_DIR=/opt/jekyll
# ENV JEKYLL_BIN=/opt/jekyll/bin
# ENV JEKYLL_ENV=development

RUN apk update \
    && apk upgrade \
    && apk add --no-cache \
    		bash \
		ca-certificates \
    && apk add --no-cache --virtual .build-deps \
       build-base \
       zlib-dev \
       libxml2-dev \
       libxslt-dev \
       readline-dev \
       libffi-dev \
       yaml-dev \
       zlib-dev \
       libffi-dev \
       cmake \
       linux-headers \
       openjdk8-jre \
    && apk add --no-cache --virtual .jekyll-rundeps \
       git \
       libxslt \
       nodejs \
       tzdata \
       bash \
       nodejs-npm \
       yarn \
    && echo "gem: --no-ri --no-rdoc" > ~/.gemrc \
    && yes | gem update --system --development \
    && gem install bundler \
    && gem install jekyll \
    && gem install jekyll-import \
    && apk del .build-deps

RUN mkdir -p /srv/jekyll
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
WORKDIR /srv/jekyll
CMD ["jekyll", "--help"]
ENTRYPOINT ["entrypoint.sh"]
