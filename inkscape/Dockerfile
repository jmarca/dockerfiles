FROM alpine:latest as symbols

LABEL maintainer "James Marca <james@activimetrics.com>"
# but I'm just copying jessfraz

RUN apk --no-cache add git

RUN mkdir /symbols \
        && git clone --depth 1 https://github.com/Xaviju/inkscape-open-symbols /usr/src/ \
        && find /usr/src -mindepth 2 -type f -name "*.svg"   -exec 'cp' '{}' "/symbols" ';'

RUN ls /symbols

FROM alpine:latest

RUN addgroup -g 1000 user \
	&& adduser -D -h /home/user -G user -u 1000 user

RUN apk update && apk upgrade && apk --no-cache add \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
        inkscape \
        git \
        dbus-libs \
        msttcorefonts-installer fontconfig \
        && update-ms-fonts && fc-cache -f

COPY --from=symbols /symbols/* /usr/share/inkscape/symbols/

USER user
VOLUME /workspace
WORKDIR /workspace

CMD [ "/usr/bin/inkscape" ]
