FROM golang:1.11-alpine3.8 AS builder
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


ENV PATH /go/bin:/usr/local/go/bin:$PATH
ENV GOPATH /go


RUN mkdir -p /work/src/hugo
WORKDIR /work/src/


ENV HUGO_VERSION v0.50
# RUN git clone --depth 1 --branch ${HUGO_VERSION} https://github.com/jmarca/hugo.git

COPY hugo/. /work/src/hugo/.

RUN cd hugo \
    && go install  --tags extended

RUN ["/go/bin/hugo","version"]

ARG PANDOC_VERSION=2.3.1

#ADD https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-linux.tar.gz /pandoc.tar.gz
COPY pandoc-${PANDOC_VERSION}-linux.tar.gz pandoc.tar.gz
RUN tar -zxvf pandoc.tar.gz
RUN mv pandoc-${PANDOC_VERSION}/bin/pandoc /pandoc
RUN mv pandoc-${PANDOC_VERSION}/bin/pandoc-citeproc /pandoc-citeproc
RUN ["/pandoc", "-v"]


FROM ubuntu:18.04 AS ubuntu

FROM frolvlad/alpine-glibc as deploy

RUN apk --no-cache add \
        libstdc++ \
        bash bash-completion sassc

# COPY --from=ubuntu /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25 /usr/lib/libstdc++.so.6


COPY --from=builder /go/bin/hugo /bin/hugo
COPY --from=builder /etc/ssl/certs/ /etc/ssl/certs
COPY --from=builder /pandoc /bin/pandoc-default
COPY --from=builder /pandoc-citeproc /bin/pandoc-citeproc


VOLUME /target

ENV HOME /home
RUN adduser -D -h $HOME -H -u 1000 -s -G user user \
        && chown -R user:user $HOME \
        && mkdir /work \
        && chown -R user:user /work \
        && chown -R user:user /target

USER user
WORKDIR /work

COPY entrypoint.sh /usr/local/bin/
COPY .bashrc  /home/.bashrc

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
CMD [ "hugo", "help" ]
