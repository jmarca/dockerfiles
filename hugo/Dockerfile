FROM golang:1.11-alpine3.7 AS builder
LABEL maintainer "James Marca <james@activimetrics.com>"

ENV CGO_ENABLED=1
ENV GOOS=linux
# ENV GO111MODULE=on


RUN apk --no-cache add \
	ca-certificates \
	gcc \
        g++ \
	git \
	libc-dev \
        musl-dev \
        libsass-dev


FROM builder as libsass
ENV PATH /go/bin:/usr/local/go/bin:$PATH
ENV GOPATH /go

RUN ls -lR /go
RUN go get -tags dev github.com/wellington/go-libsass/libs
RUN ls -lR /go

FROM libsass as hugo

ENV PATH /go/bin:/usr/local/go/bin:$PATH
ENV GOPATH /go


RUN mkdir -p /work/src/
WORKDIR /work/src/


ENV HUGO_VERSION v0.49.1
RUN git clone --depth 1 --branch ${HUGO_VERSION} https://github.com/gohugoio/hugo.git

RUN cd hugo \
    && go install

RUN ["/go/bin/hugo","version"]

ARG PANDOC_VERSION=2.3.1

RUN wget https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-linux.tar.gz -O /tmp/pandoc-${PANDOC_VERSION}-linux.tar.gz
RUN tar -zxvf /tmp/pandoc-${PANDOC_VERSION}-linux.tar.gz
RUN mv pandoc-${PANDOC_VERSION}/bin/pandoc /pandoc
RUN mv pandoc-${PANDOC_VERSION}/bin/pandoc-citeproc /pandoc-citeproc
RUN ["/pandoc", "--version"]


FROM alpine:latest as deploy
RUN apk --no-cache add \
        bash bash-completion sassc



COPY --from=hugo /pandoc /bin/pandoc
COPY --from=hugo /pandoc-citeproc /bin/pandoc-citeproc
COPY --from=hugo /go/bin/hugo /bin/hugo
COPY --from=hugo /etc/ssl/certs/ /etc/ssl/certs


VOLUME /target

ENV HOME /home
RUN adduser -D -h $HOME -H -u 1000 -s -G user user \
    && chown -R user:user $HOME \
    && chown -R user:user /target

USER user
WORKDIR /home

ENTRYPOINT [ "hugo" ]
CMD [ "help" ]


# # ENTRYPOINT ["sh", "/run.sh"]
