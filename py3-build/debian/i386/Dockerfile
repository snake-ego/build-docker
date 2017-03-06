FROM i386/debian:jessie-slim

# Install Python 
ENV PYVER='3.5.3'

RUN echo "\033[36m === Install Python $PYVER\033[0m" \
    && set -x \
    && apt update \
    && apt -y upgrade \
    && apt -y install \
        curl \
        libssl-dev \
        binutils \
        openssl \
        gcc \
        make \
        git \
    && cd /usr/local/src/ \
    && curl -sL https://www.python.org/ftp/python/$PYVER/Python-$PYVER.tgz | tar -xz \
    && cd Python* \
    && ./configure --enable-shared \
    && make altinstall \
    && cd - \
    && rm -rf Python* \
    && apt -y remove \
        curl \
        libssl-dev \
        openssl \
        gcc \
    && apt-get -y autoremove \
    && apt-get clean \
    && cd ~ \

RUN echo "\033[36m === Install PyInstaller\033[0m" \
    && set -x \
    && ln -sf /usr/local/bin/pip3.5 /usr/local/bin/pip \
    && pip3.5 install -U pip \
    && pip3.5 install pyinstaller 

RUN  mkdir -p /app/project /app/data /app/build
WORKDIR /app/project

VOLUME ["/app/project", "/app/data", "/app/build"]
ENTRYPOINT ["/usr/bin/make"]
