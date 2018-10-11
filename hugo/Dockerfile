FROM golang:1.11-alpine3.7 AS builder
LABEL maintainer "James Marca <james@activimetrics.com>"

RUN apk --no-cache add \
	ca-certificates \
	gcc \
	git \
	libc-dev

ENV PATH /go/bin:/usr/local/go/bin:$PATH
ENV GOPATH /go
ENV HUGO_BUILD_TAGS extended
ENV HUGO_VERSION v0.49.1
RUN mkdir -p /work/src/

WORKDIR /work/src

RUN git clone --depth 1 --branch ${HUGO_VERSION} https://github.com/gohugoio/hugo.git

RUN cd hugo \
    && go install




ARG PANDOC_VERSION=2.3.1

ADD https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-linux.tar.gz pandoc-${PANDOC_VERSION}-linux.tar.gz
RUN tar -zxvf pandoc-${PANDOC_VERSION}-linux.tar.gz
RUN mv pandoc-${PANDOC_VERSION}/bin/pandoc /pandoc
RUN mv pandoc-${PANDOC_VERSION}/bin/pandoc-citeproc /pandoc-citeproc
RUN ["/pandoc", "-v"]


FROM alpine:latest
RUN apk --no-cache add \
    bash bash-completion
COPY --from=builder /pandoc /bin/pandoc-default
COPY --from=builder /pandoc-citeproc /bin/pandoc-citeproc
COPY --from=builder /go/bin/hugo /bin/hugo
COPY --from=builder /etc/ssl/certs/ /etc/ssl/certs

VOLUME /src /target
WORKDIR /src

ENTRYPOINT [ "hugo" ]
CMD [ "help" ]


# # ENTRYPOINT ["sh", "/run.sh"]
