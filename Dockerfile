#: title  : danhatesnumbers/xelatex
#: author : "Dan Murphy" <danhatesnumbers@gmail.com>
#: version: "1.0.0"
FROM debian:8
MAINTAINER danhatesnumbers@gmail.com

LABEL version="1.0.0"

ENV DEBIAN_FRONTEND noninteractive

# Install all TeX and LaTeX dependences
RUN apt-get update && \
  apt-get install --yes --no-install-recommends \
  git \
  ca-certificates \
  inotify-tools \
  lmodern \
  make \
  texlive-fonts-recommended \
  texlive-fonts-extra \
  texlive-generic-recommended \
  texlive-lang-english \
  texlive-xetex && \
  apt-get autoclean && apt-get --purge --yes autoremove && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Export the output data
WORKDIR /data
VOLUME ["/data"]

