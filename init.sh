#!/bin/sh

#yum -y update

#install v2ray

curl https://install.direct/go.sh | sh

yum -y install lrzsz socat

#make cert
curl https://get.acme.sh | sh
source ~/.bashrc

~/.acme.sh/acme.sh --issue -d de.auxssrost.cf --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d de.auxssrost.cf --fullchainpath /etc/v2ray/v2ray.crt --keypath /etc/v2ray/v2ray.key --ecc

rm -f /etc/v2ray/config.json
wget 
#v2ray start
systemctl start v2ray
