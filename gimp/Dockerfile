FROM debian:buster
LABEL maintainer "James Marca"

RUN apt-get update && apt-get install -y \
    gimp \
	  dbus \
	  dbus-x11 \
	  libgl1-mesa-dri \
	  libgl1-mesa-glx \
	  --no-install-recommends \
	  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "gimp" ]
