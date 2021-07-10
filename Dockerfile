FROM odoo:14.0

USER root
RUN apt-get update && \
    apt-get install git vim python3 python3-pip xmlsec1 libffi-dev \
    python3-dev autoconf libtool \
    pkg-config build-essential libxmlsec1-dev libxmlsec1-openssl -y

USER odoo
COPY ./odoo-brasil /mnt/extra-addons
WORKDIR /mnt/extra-addons
RUN python3 -m pip install --upgrade pip setuptools wheel && \
    python3 -m pip install cryptography && \
    python3 -m pip install -r requirements.txt

COPY ./odoo.conf /etc/odoo/
