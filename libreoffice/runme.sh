docker run --rm -d -v /etc/localtime:/etc/localtime:ro -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix:0 -v /home/james/taxes:/root/taxes --name libreoffice jess/libreoffice
