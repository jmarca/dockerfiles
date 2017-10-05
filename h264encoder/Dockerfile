# The old h264enc script that is no longer maintained
#
# docker run -d \
#	-v /etc/localtime:/etc/localtime:ro \
#	--device /dev/snd \
#	--device /dev/dri \
#	-v /tmp/.X11-unix:/tmp/.X11-unix \
# 	-v ${PWD}/Movies:/home/ripper/Movies \
#	-e DISPLAY=unix$DISPLAY \
#	--name vlc \
#	jmarca/h264encoder
#
FROM jrottenberg/ffmpeg
LABEL maintainer "James Marca <blind.line.drawing@gmail.com>"
ADD . /h264enc
ADD lsdvd /lsdvd

RUN  buildDeps="autoconf \
                build-base \
                   automake \
                   bash \
                   binutils \
                   bzip2 \
                   cmake \
                   curl \
                   coreutils \
                   expat-dev \
                   file \
                   g++ \
                   gcc \
                   gperf \
                   libtool \
                   make \
                   python \
                   openssl-dev \
                   tar \
                   yasm \
                   zlib-dev" \
          && deps=' \
		mplayer \
		mkvtoolnix \
                # x264 \
                # lame \
                # faac \
                # flac \
                bash \
                bc \
                pv \
                libdvdread \
                libdvdread-dev \
                libdvdcss \
		'  \
        && apk  --no-cache add --update ${buildDeps} ${deps} libgcc libstdc++ ca-certificates libcrypto1.0 libssl1.0 \
	&& apk --no-cache add $deps

RUN cd /lsdvd && ./configure && make -j4 && make install

ENV HOME /home/h264enc
RUN useradd --create-home --home-dir $HOME h264enc \
	&& chown -R h264enc:h264enc $HOME \
	&& usermod -a -G audio,video h264enc


CMD [ "/bin/bash" ]
