FROM ubuntu:18.04

MAINTAINER Justin Henderson justin@hasecuritysolutions.com

RUN apt update \
    && echo "debconf debconf/frontend select noninteractive" | debconf-set-selections \
    && apt install -y build-essential python3-dev python3-pip ttf-mscorefonts-installer python3-setuptools python3-wheel python3-cffi libcairo2 libpango-1.0-0 libpangocairo-1.0-0 libgdk-pixbuf2.0-0 libffi-dev shared-mime-info \
    && pip3 install --upgrade pip setuptools \
    && export PATH="${HOME}/.local/bin:$PATH" \
    && pip3 install WeasyPrint==49 \
    && pip3 install mkdocs==1.0.4 \
    && pip3 install mkdocs-material==4.6.3 \
    && pip3 install cairocffi==1.0.2 \
    && pip3 install mkdocs-pdf-export-plugin==0.5.5 \
    && pip3 install mkdocs-exclude \
    && pip3 install mkdocs-minify-plugin \
    && echo "LC_ALL=C.UTF-8" >> /etc/profile \
    && apt clean -y
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

STOPSIGNAL SIGTERM
CMD  mkdocs build -f /mkdocs/mkdocs.yml
