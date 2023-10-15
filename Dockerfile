FROM ubuntu:18.04

LABEL version="1.0"
LABEL author="Ashish Jha <contact@ashishjha.com>"


ARG GUNICORN_WORKERS


ENV GUNICORN_WORKERS=${GUNICORN_WORKERS:-4}



RUN apt-get update && \
    apt-get install -y wget curl apt-utils apt-transport-https debconf-utils \
    build-essential gcc locales curl openjdk-8-jdk ca-certificates-java \
    libpq-dev python-dev libxml2-dev libxslt1-dev libldap2-dev libsasl2-dev


############################################
# INSTALL PYTHON LIBRARIES & OTHER TOOLS
############################################

RUN apt-get install -y \
        python3 \
        python3-pip \
        python3-wheel \
        python3-cffi

RUN python3 -m pip install --upgrade pip==23.2.1 setuptools


##########################################
# SETUP PROJECT CONF
##########################################

WORKDIR /app
ADD ./requirements.txt requirements.txt
RUN python3 -m pip install -r requirements.txt

COPY . /app/

EXPOSE 7777
STOPSIGNAL SIGINT
ENTRYPOINT gunicorn app.main:app --bind 0.0.0.0:7777 -k uvicorn.workers.UvicornWorker --workers ${GUNICORN_WORKERS} --timeout 900
# ENTRYPOINT ["gunicorn", "app.main:app", "--bind", "0.0.0.0:7777", "-k", "uvicorn.workers.UvicornWorker", "--workers", $GUNICORN_WORKERS, "--timeout", "900"]
