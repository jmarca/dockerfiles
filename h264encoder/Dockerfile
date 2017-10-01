# The old h264enc script that is no longer maintained
#
# docker run --rm \
# 	-it \
# 	-v ${PWD}/Movies:/home/ripper/Movies \
#
FROM alpine:latest
LABEL maintainer "James Marca <blind.line.drawing@gmail.com>"
ADD . /h264enc
RUN builddeps=' \
		mplayer \
		mkvtoolnix \
                x264-libs \
                x264 \
                lame \
                faac \
                flac \
		' \
	&& apk --no-cache add \
	$builddeps \
	&& apk del --purge $builddeps
RUN cd /h264enc \
    && make install

CMD [ "/bin/bash" ]
