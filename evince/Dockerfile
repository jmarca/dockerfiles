# Run evince with more fonts
FROM jess/evince:latest
LABEL maintainer "James Marca <james@activimetrics.com>"

RUN apk --no-cache add --update \
        msttcorefonts-installer \
        fontconfig \
        font-noto \
        font-adobe-100dpi  && \
        update-ms-fonts && \
        fc-cache -f
