# Run R in a container
#
# docker run -it \
#	-v /tmp/.X11-unix:/tmp/.X11-unix \ # mount the X11 socket
#	-e DISPLAY=unix$DISPLAY \
#	-v $HOME/rscripts:/root/rscripts \
#	--device /dev/dri \
#	--name rstats \
#	jmarca/rstats
#

# Base docker image
FROM rocker/geospatial
LABEL maintainer "James Marca <james@activimetrics.com>"

RUN  useradd docker \
	&& mkdir /home/docker \
	&& chown docker:docker /home/docker \
	&& addgroup docker staff

CMD ["R"]
