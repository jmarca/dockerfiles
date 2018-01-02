FROM darktable/darktable

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl \
    libgl1-mesa-dri \
    libgl1-mesa-glx \
    usbutils \
    x11-xserver-utils && \
    apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /src/*.deb

ENV DARKTABLE_SHA256 9d37388aee79d5ada71062bbac3cda612a61d1a781f6320b784b27308f3a1878
ENV CC gcc-7
ENV CXX g++-7
## ENV TARGET build

RUN set -x \
&& curl -fSL "https://github.com/darktable-org/darktable/releases/download/release-2.4.0/darktable-2.4.0.tar.xz" -o /tmp/darktable.tgz \
&& echo "${DARKTABLE_SHA256} /tmp/darktable.tgz" | sha256sum -c - \
&& mkdir -p /usr/src/darktable \
&& cd /usr/src/darktable \
&& tar -xvf /tmp/darktable.tgz \
&& rm /tmp/darktable.tgz \
&& cd darktable-2.4.0 \
&& ./build.sh \
&& cmake --build "/usr/src/darktable/darktable-2.4.0/build" --target install -- -j4

# Add darktable user named james
RUN groupadd -r darktable && useradd -r -g darktable -G audio,video james \
    && mkdir -p /home/james/Downloads && chown -R james:darktable /home/james



# Run Darktable as non privileged user
USER james
ENV PATH "$PATH:/opt/darktable/bin"

# Autorun darktable

ENTRYPOINT [ "/opt/darktable/bin/darktable" ]
