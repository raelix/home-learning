
FROM ubuntu:14.04

RUN apt-get update \
    && apt-get upgrade -y \
    ssh \
    git \
    libpq-dev \
    python-pip \
    python2.7 \
    python2.7-dev \
    wget \
    curl \
    pkg-config \
    python-dev \
    zip \
    psmisc \
    vim \
    postgresql-client \
    python-psycopg2 \
    && apt-get autoremove \
    && apt-get clean

RUN apt-get install -f -y postgresql-client


