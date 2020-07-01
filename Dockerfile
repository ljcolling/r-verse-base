FROM rocker/r-ver:4.0.0


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

RUN install2.r --error \
    --deps TRUE \
    httr

CMD [ "R" ]