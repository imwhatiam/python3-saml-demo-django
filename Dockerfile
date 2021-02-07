FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt -qy upgrade
RUN apt install -yq pkg-config vim tmux less git wget python3 python3-pip libxml2-dev libxmlsec1-dev libxmlsec1-openssl

WORKDIR /root
RUN git clone https://github.com/onelogin/python3-saml.git

WORKDIR /root/python3-saml/demo-django/
RUN pip3 install -r requirements.txt

COPY settings.json /root/python3-saml/demo-django/saml/
