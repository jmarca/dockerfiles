FROM debian:stretch
LABEL maintainer "James Marca"

RUN apt-get update && apt-get install -y \
    sane \
    sane-utils \
    libsane-extras \
    xsane \
	  libgl1-mesa-dri \
	  libgl1-mesa-glx \
	  --no-install-recommends \
	  && rm -rf /var/lib/apt/lists/*

ENV HOME /home/xsane
RUN useradd --create-home --home-dir $HOME xsane \
&& chown -R xsane:xsane $HOME \
&& usermod -a -G audio,video xsane

WORKDIR $HOME
USER xsane

ENTRYPOINT [ "xsane" ]
