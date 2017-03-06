FROM python:3.5

RUN echo "\033[36m === Prepare === \033[0m" \
    && set -x \
    && apt update \
    && apt -y install \
        make \
        git \
    && apt-get autoremove -y \
    && apt-get clean 

RUN echo "\033[36m === Install PyInstaller === \033[0m" \
    && set -x \
    && pip install -U pip \
    && pip install pyinstaller

RUN  mkdir -p /app/project /app/data /app/build
WORKDIR /app/project

VOLUME ["/app/project", "/app/data", "/app/build"]
ENTRYPOINT ["/usr/bin/make"]
