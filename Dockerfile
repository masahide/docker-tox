FROM ubuntu:xenial

ENV TOX_VERSION 3.13.2
ENV TOX_PIP_EXT_VERSION 1.6.0

RUN gpg --keyserver keyserver.ubuntu.com --recv-keys 6A755776 \
  && gpg --export 6A755776 | apt-key add - \
  && gpg --keyserver keyserver.ubuntu.com --recv-keys 68854915 \
  && gpg --export 68854915 | apt-key add -

RUN printf '%s\n' \
  'deb http://ppa.launchpad.net/deadsnakes/ppa/ubuntu xenial main' \
  'deb-src http://ppa.launchpad.net/deadsnakes/ppa/ubuntu xenial main' \
  'deb http://ppa.launchpad.net/pypy/ppa/ubuntu xenial main' \
  'deb-src http://ppa.launchpad.net/pypy/ppa/ubuntu xenial main' \
  | tee -a /etc/apt/sources.list >/dev/null

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    git \
    curl \
    python2.7-dev \
    python3.6-dev \
    python3.7-dev \
    pypy-dev \
    build-essential \
    make \
  && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://bootstrap.pypa.io/get-pip.py | pypy \
  && curl -fsSL https://bootstrap.pypa.io/get-pip.py | python3.7 \
  && pip install tox==$TOX_VERSION tox-pip-extensions==$TOX_PIP_EXT_VERSION \
  && rm -rf /root/.cache/pip
