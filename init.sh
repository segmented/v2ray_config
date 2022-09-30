#!/bin/sh
#yum -y update

#install v2ray

#curl https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh | sh
curl https://raw.githubusercontent.com/segmented/fhs-install-v2ray/master/install-release.sh |  bash

#back to 4.45.0
#wget https://raw.githubusercontent.com/segmented/fhs-install-v2ray/master/install-release.sh
#bash  install-release.sh  --version v4.45.0
#curl https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-dat-release.sh | sh
curl https://raw.githubusercontent.com/segmented/fhs-install-v2ray/master/install-dat-release.sh | bash
source ~/.bashrc

#yum -y install lrzsz socat
#make cert
#curl https://get.acme.sh | sh
#source ~/.bashrc
#~/.acme.sh/acme.sh --issue -d de.auxssrost.cf --standalone -k ec-256
#~/.acme.sh/acme.sh --installcert -d de.auxssrost.cf --fullchainpath /etc/v2ray/v2ray.crt --keypath /etc/v2ray/v2ray.key --ecc

systemctl stop firewalld.service
#cd /etc/systemd/system/v2ray.service.d/
#rm -f 10-donot_touch_single_conf.conf
#wget https://raw.githubusercontent.com/segmented/v2ray_config/master/10-donot_touch_single_conf.conf

cd /usr/local/etc/v2ray/
rm -f config.json
wget https://raw.githubusercontent.com/segmented/v2ray_config/master/v2ray.crt
wget https://raw.githubusercontent.com/segmented/v2ray_config/master/v2ray.key
wget https://raw.githubusercontent.com/segmented/v2ray_config/master/config.json

#mkdir /usr/local/etc/v2ray
#cd /usr/local/etc/v2ray
#rm -f config.json
#wget https://raw.githubusercontent.com/segmented/v2ray_config/master/config.json

rm -rf /etc/systemd/system/v2ray.service.d/10-donot_touch_single_conf.conf
systemctl daemon-reload
systemctl restart v2ray

#systemctl start v2ray
#v2ray run
#v2ray 
