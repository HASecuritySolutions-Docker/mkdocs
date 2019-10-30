FROM ubuntu:18.04

MAINTAINER Justin Henderson justin@hasecuritysolutions.com

RUN apt update \
    && apt install -y build-essential python3-dev python3-pip python3-setuptools python3-wheel python3-cffi libcairo2 libpango-1.0-0 libpangocairo-1.0-0 libgdk-pixbuf2.0-0 libffi-dev shared-mime-info \
    && pip3 install --upgrade pip setuptools \
    && export PATH="${HOME}/.local/bin:$PATH" \
    && pip3 install WeasyPrint \
    && pip3 install mkdocs \
    && pip3 install mkdocs-material \
    && pip3 install cairocffi==1.0.2 \
    && pip3 install mkdocs-pdf-export-plugin \
    && export LC_ALL=C.UTF-8 \
    && apt clean -y

STOPSIGNAL SIGTERM
CMD  mkdocs build -d /mkdocs
