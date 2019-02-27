#!/bin/sh

#yum -y update

#install v2ray

curl https://install.direct/go.sh | sh
source ~/.bashrc

#yum -y install lrzsz socat
#make cert
#curl https://get.acme.sh | sh
#source ~/.bashrc
#~/.acme.sh/acme.sh --issue -d de.auxssrost.cf --standalone -k ec-256
#~/.acme.sh/acme.sh --installcert -d de.auxssrost.cf --fullchainpath /etc/v2ray/v2ray.crt --keypath /etc/v2ray/v2ray.key --ecc

systemctl stop firewalld.service
cd /etc/v2ray
rm -f config.json
wget https://raw.githubusercontent.com/u403/v2ray_config/master/config.json
wget https://raw.githubusercontent.com/u403/v2ray_config/master/v2ray.crt
wget https://raw.githubusercontent.com/u403/v2ray_config/master/v2ray.key

systemctl start v2ray
