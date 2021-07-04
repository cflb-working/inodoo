FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
# Base dependence
RUN apt-get update && apt-get install -y git virtualenv python3 xz-utils \
                       wget fontconfig libfreetype6 libx11-6 \
                       libxext6 libxrender1 xfonts-75dpi gitg

# Build dependence
RUN apt-get install -y gcc build-essential python3-dev libxslt1-dev \
                       libldap2-dev libsasl2-dev python3-pip \
                       libzip-dev libssl-dev libxml2-dev python3-venv zip \
                        postgresql postgresql-contrib postgresql-client

RUN mkdir /opt/odoo
WORKDIR /opt/odoo

RUN wget https://github.com/odoo/odoo/archive/refs/heads/13.0.zip && unzip 13.0.zip && mv odoo-13.0 13 && rm -rf 13.0.zip 
RUN pip3 install -r 13/requirements.txt
COPY ./odoo.conf /etc/odoo/

CMD ["/opt/odoo/13/odoo-bin", "--conf", "/etc/odoo/odoo.conf"]
