FROM ubuntu:20.04

LABEL org.label-schema.license="MIT" \
    org.label-schema.vcs-url="https://github.com/ljcolling/r-verse-base" \
    maintainer="Lincoln J Colling"

ENV R_VERSION=4.0.0
ENV TERM=xterm
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV R_HOME=/usr/local/lib/R
ENV CRAN=https://mran.microsoft.com/snapshot/2020-06-06
ENV TZ=UTC

COPY scripts /rocker_scripts

RUN /rocker_scripts/install_R.sh


CMD ["R"]

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
    libxml2-dev \
    libcairo2-dev \
    libsqlite-dev \
    libmariadbd-dev \
    libmariadbclient-dev \
    libpq-dev \
    libssh2-1-dev \
    unixodbc-dev \
    libsasl2-dev 

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    file \
    git \
    libapparmor1 \
    libclang-dev \
    libcurl4-openssl-dev \
    libedit2 \
    libssl-dev \
    lsb-release 

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
#    multiarch-support \
    psmisc \
    procps \
    python-setuptools \
    sudo \
    wget

# Install linux pacakges for gsl 
RUN apt-get update && apt-get install -y \
    default-libmysqlclient-dev \
    libmysqlclient-dev \
    libgdal-dev \
    libproj-dev \
    libgsl-dev \
    libgslcblas0


RUN install2.r --error \
    --deps TRUE \
    tidyverse \
    xfun

CMD [ "R" ]