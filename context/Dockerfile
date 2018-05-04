FROM debian:stretch

# Install packages to download ConTeXt minimals
RUN apt-get update \
  && apt-get install -y --no-install-recommends rsync inotify-tools \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Install ConTeXt minimals
# http://wiki.contextgarden.net/ConTeXt_Standalone
RUN mkdir /opt/context \
  && cd /opt/context \
  && rsync -ptv rsync://contextgarden.net/minimals/setup/first-setup.sh . \
  && sh ./first-setup.sh --modules=all


ENV HOME /home/user
RUN useradd --create-home --home-dir $HOME user \
        && chown -R user:user $HOME
ENV LANG C.UTF-8

WORKDIR $HOME
USER user

ENV PATH="/opt/context/tex/texmf-linux-64/bin:${PATH}"
COPY ./entrypoint.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["context"]
