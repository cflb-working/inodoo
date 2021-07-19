FROM odoo:13.0

USER root
RUN mkdir -p /opt/odoo && chown odoo:odoo -R /opt/odoo

RUN apt-get update && \
    apt-get install git vim python3 python3-pip xmlsec1 libffi-dev \
    python3-dev autoconf libtool wget zip \
    pkg-config build-essential libxmlsec1-dev libxmlsec1-openssl \
    python3-dev gcc python3-venv python3-wheel -y

USER odoo

WORKDIR /opt/odoo
RUN wget https://github.com/Code-137/odoo-brasil/archive/refs/heads/13.0.zip
RUN unzip 13.0.zip -d odoo13
#RUN pip3 install --user iugu
#RUN git clone https://github.com/iugu/iugu-python.git && python3 iugu-python/setup.py install

RUN python3 -m pip install --upgrade pip setuptools wheel --no-warn-script-location && \
    python3 -m pip install cryptography && \
    python3 -m pip install -r odoo13/odoo-brasil-13.0/requirements.txt && rm -rf *.zip 

RUN wget https://github.com/Code-137/odoo-apps/archive/refs/heads/13.0.zip && unzip 13.0.zip -d odoo13-apps && \
    python3 -m pip install -r odoo13-apps/odoo-apps-13.0/requirements.txt && rm -rf *.zip 

COPY ./odoo.conf /etc/odoo/
