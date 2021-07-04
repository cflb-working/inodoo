FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
# Base dependence
RUN apt-get update && apt-get install -y git virtualenv python3 xz-utils \
                       wget fontconfig libfreetype6 libx11-6 \
                       libxext6 libxrender1 xfonts-75dpi gitg

# Build dependence
RUN apt-get install -y gcc build-essential python3-dev libxslt1-dev \
                       libldap2-dev libsasl2-dev python3-pip \
                       libzip-dev libssl-dev libxml2-dev python3-venv

RUN mkdir /opt/odoo
WORKDIR /opt/odoo

RUN virtualenv venv --python=python3
RUN . venv/bin/activate
RUN git clone https://github.com/odoo/odoo.git core
RUN pip install -r core/requirements.txt


#CMD ['odoo']
