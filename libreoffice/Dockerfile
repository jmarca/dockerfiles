# Run Libreoffice in a container

# docker run -d \
#	-v /etc/localtime:/etc/localtime:ro \
#	-v /tmp/.X11-unix:/tmp/.X11-unix \
#	-e DISPLAY=unix$DISPLAY \
#	-v $HOME/slides:/root/slides \
#	-e GDK_SCALE \
#	-e GDK_DPI_SCALE \
#	--name libreoffice \
#	jess/libreoffice
#
FROM jess/libreoffice:latest
LABEL maintainer "James Marca <james@activimetrics.com>"

RUN apk --no-cache add --update \
    openjdk8-jre-base \
 && echo "securerandom.source=file:/dev/urandom" >> /usr/lib/jvm/default-jvm/jre/lib/security/java.security

ENTRYPOINT [ "libreoffice" ]
