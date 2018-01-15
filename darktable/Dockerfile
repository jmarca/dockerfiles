FROM debian:buster

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    darktable \
    libgl1-mesa-dri \
    libgl1-mesa-glx \
    usbutils \
    x11-xserver-utils && \
    apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Add darktable user named james
RUN groupadd -r darktable && useradd -r -g darktable -G audio,video james \
    && mkdir -p /home/james/Downloads && chown -R james:darktable /home/james

# Run Darktable as non privileged user
USER james

ENV QT_AUTO_SCREEN_SCALE_FACTOR 1
ENV GDK_SCALE 2
ENV GDK_DPI_SCALE 1.0
ENV QT_DEVICE_PIXEL_RATIO 2

# Autorun darktable

ENTRYPOINT [ "/usr/bin/darktable" ]
