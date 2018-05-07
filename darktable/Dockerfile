FROM debian:buster


RUN apt-get update && \
    apt-get install  -y --no-install-recommends \
    autoconf \
    automake \
    bash \
    build-essential \
    ca-certificates \
    cmake \
    cmake \
    curl \
    debhelper \
    debhelper \
    g++ \
    gcc \
    git \
    git \
    intltool \
    libcairo2-dev \
    libcolord-dev \
    libcolord-gtk-dev \
    libcups2-dev \
    libcurl4-gnutls-dev \
    libexiv2-dev \
    libflickcurl-dev \
    libgl1-mesa-dri \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libglib2.0-dev \
    libglib2.0-dev \
    libgphoto2-dev \
    libgraphicsmagick1-dev \
    libgtk-3-dev \
    libjpeg-dev \
    libjson-glib-dev \
    liblcms2-dev \
    liblua5.3-dev \
    libopenexr-dev \
    libopenjp2-7-dev \
    libosmgpsmap-1.0-dev \
    libpng-dev \
    libpng-dev \
    libpugixml-dev \
    librsvg2-dev \
    libsecret-1-dev \
    libsoup2.4-dev \
    libsqlite3-dev \
    libtiff-dev \
    libwebp-dev \
    llvm-4.0 \
    make \
    pkg-config \
    tar \
    usbutils \
    x11-xserver-utils \
    x11-xserver-utils \
    xsltproc \
    xz-utils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# git clone --depth 1  https://git.code.sf.net/p/lensfun/code /usr/src/lensfun \

RUN \
    git clone --depth 1 git://git.code.sf.net/p/lensfun/code /usr/src/lensfun \
    && ( \
            cd /usr/src/lensfun \
            && mkdir build && cd build \
            && cmake  -DBUILD_FOR_SSE=ON \
                      -DBUILD_FOR_SSE2=ON \
                      -DCMAKE_BUILD_TYPE=Release \
                      -DCMAKE_INSTALL_PREFIX=/usr \
                      .. \
            && make all \
            && make install \
    ) \
    && rm -rf /usr/src/lensfun  \
    && cd /usr/src \
    && curl -sSOL https://github.com/darktable-org/darktable/releases/download/release-2.4.3/darktable-2.4.3.tar.xz \
    && ( \
         ls -lrt \
         && tar xvf darktable-2.4.3.tar.xz \
         && cd darktable-2.4.3 \
         && mkdir build && cd build \
         && cmake -DCMAKE_BUILD_TYPE=Release \
                  -DBUILD_FOR_SSE=ON \
                  -DBUILD_FOR_SSE2=ON \
                  -DCMAKE_BUILD_TYPE=Release \
                  -DCMAKE_INSTALL_PREFIX=/usr \
                  .. \
         && make -j5 \
         && make install \
    ) \
    && rm -rf /usr/src/darktable* \
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
