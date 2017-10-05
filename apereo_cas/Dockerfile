# docker run --rm -it -p 1234:22 \
# 	-e DEBUG=true \
# 	-e "PUBKEY=$(cat ~/.ssh/id_ed25519.pub)" \
# 	--name gitserver \
# 	jmarca/apereo_cas
FROM maven:alpine
LABEL maintainer "James Marca <james@activimetrics.com>"

ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk

RUN apk add --no-cache \
	bash \
	ca-certificates

RUN buildDeps=' \
                build-base \
                git \
                ' \
        && set -x \
        && apk --no-cache add $buildDeps \
        && git clone --depth 1 https://github.com/apereo/cas-configserver-overlay  /usr/src/cas-configserver-overlay \
	&& cd /usr/src/cas-configserver-overlay \
        && ./build.sh package\
        && apk del $buildDeps
#	&& rm -rf /usr/src/cas-configserver-overlay \
	&& echo "Build complete."

COPY log4j2.xml cas.properties application.yml /etc/cas/config/

WORKDIR /usr/src/cas-configserver-overlay

ENTRYPOINT [ "bash" ]
