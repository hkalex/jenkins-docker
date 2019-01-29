#!/bin/bash

mkdir -p ./ssl
mkdir -p ./jenkins_home
chmod 777 ./jenkins_home


if [ ! -f ./ssl/jenkins.key ]; then
  openssl genrsa -out ./ssl/jenkins.pem 2048
  openssl req -new -x509 -key ./ssl/jenkins.pem -out ./ssl/jenkins.cer -days 1825 -subj "/C=AU/ST=NSW/L=Jenkins/O=localhost/CN=localhost"
  openssl pkcs12 -export -out ./ssl/jenkins.pfx -inkey ./ssl/jenkins.pem -in ./ssl/jenkins.cer
fi
