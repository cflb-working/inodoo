FROM odoo:13.0

USER root
RUN mkdir /opt/odoo
RUN apt-get update && apt-get upgrade -y
RUN apt-get install swig git vim build-essential python3.7-dev xmlsec1 libxmlsec1  libxmlsec1-dev pkg-config openssl python-lxml libxml2-dev libxmlsec1-openssl -y

RUN pip3 install --upgrade pip setuptools wheel

ADD ./extra/my-addons /mnt/extra-addons
ADD ./extra/iugu-python /opt/odoo/iugu/

WORKDIR /opt/odoo/iugu
# RUN find /usr -name '*.pyc' -delete
RUN python3 setup.py install

USER root
RUN pip3 install mercadopago==1.1.1 mpmath

USER odoo
WORKDIR /mnt/extra-addons

RUN pip3 install -r requirements-accout.txt
RUN pip3 install -r requirements-l10.txt
RUN pip3 install xmlsec --trusted-host --extra-index-url=https://hoefling.io/pypi/

COPY ./odoo.conf /etc/odoo/odoo.conf
EXPOSE 8069