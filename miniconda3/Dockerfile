FROM python:3-stretch
LABEL maintainer "James Marca <blind.line.drawing@gmail.com>"

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

ADD requirements.txt requirements.txt

RUN apt-get update --fix-missing && apt-get install -y wget bzip2 ca-certificates \
    libglib2.0-0 libxext6 libsm6 libxrender1 \
    git mercurial subversion


RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget  https://repo.continuum.io/miniconda/Miniconda3-4.3.14-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh

RUN apt-get install -y curl grep sed dpkg && \
    TINI_VERSION=`curl https://github.com/krallin/tini/releases/latest | grep -o "/v.*\"" | sed 's:^..\(.*\).$:\1:'` && \
    curl -L "https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini_${TINI_VERSION}.deb" > tini.deb && \
    dpkg -i tini.deb && \
    rm tini.deb && \
    apt-get clean

RUN /opt/conda/bin/conda install jupyter -y

RUN /opt/conda/bin/conda config --append channels conda-forge \
    && /opt/conda/bin/conda install --file requirements.txt -y

ENV PATH /opt/conda/bin:$PATH


# Add conda user
RUN groupadd -r conda && useradd -u 1000 -r -g conda -G audio,video conda \
    && mkdir -p /home/conda \
    && chown -R conda:conda /home/conda

# Run as non privileged user
USER conda

# && /opt/conda/bin/source activate myenv \

# RUN /opt/conda/bin/conda create --name myenv -y \
#    && pip install -r requirements.txt

ENTRYPOINT [ "/usr/bin/tini", "--" ]
CMD [ "/bin/bash" ]
