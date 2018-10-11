FROM golang:alpine as builder
LABEL maintainer "James Marca <james@activimetrics.com>"

RUN apk --no-cache add \
	ca-certificates \
	gcc \
	git \
	libc-dev

ENV PATH /go/bin:/usr/local/go/bin:$PATH
ENV GOPATH /go

ENV HUGO_VERSION v0.49.1

RUN git clone --depth 1 --branch ${HUGO_VERSION} https://github.com/gohugoio/hugo.git /go/src/github.com/gohugoio/hugo

WORKDIR /go/src/github.com/gohugoio/hugo

RUN  go install --tags extended

FROM alpine:latest
RUN apk --no-cache add \
    bash bash-completion
COPY --from=builder  /bin/hugo /bin/hugo
COPY --from=builder /etc/ssl/certs/ /etc/ssl/certs

VOLUME /src /target
WORKDIR /src

ENTRYPOINT [ "hugo" ]
CMD [ "help" ]


# ENTRYPOINT ["sh", "/run.sh"]
