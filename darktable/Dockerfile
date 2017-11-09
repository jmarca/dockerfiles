FROM debian:stretch

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      darktable \
      libgl1-mesa-dri \
      libgl1-mesa-glx \
      usbutils \
      x11-xserver-utils && \
    apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /src/*.deb

# Add darktable user
RUN groupadd -r darktable && useradd -r -g darktable -G audio,video darktable \
    && mkdir -p /home/darktable/Downloads && chown -R darktable:darktable /home/darktable

# Run Darktable as non privileged user
USER darktable

# Autorun darktable

ENTRYPOINT [ "darktable" ]
