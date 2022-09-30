#!/bin/sh
#yum -y update

#back to 4.45.0
#wget https://raw.githubusercontent.com/segmented/fhs-install-v2ray/master/install-release.sh
#bash  install-release.sh  --version v4.45.0

curl https://raw.githubusercontent.com/segmented/fhs-install-v2ray/master/install-release.sh | bash
curl https://raw.githubusercontent.com/segmented/fhs-install-v2ray/master/install-dat-release.sh | bash
source ~/.bashrc

#make cert
#curl https://get.acme.sh | sh
#source ~/.bashrc
#~/.acme.sh/acme.sh --issue -d de.auxssrost.cf --standalone -k ec-256
#~/.acme.sh/acme.sh --installcert -d de.auxssrost.cf --fullchainpath /etc/v2ray/v2ray.crt --keypath /etc/v2ray/v2ray.key --ecc

systemctl stop firewalld.service

cd /usr/local/etc/v2ray/
rm -f config.json
wget https://raw.githubusercontent.com/segmented/v2ray_config/master/certs/v2ray.crt
wget https://raw.githubusercontent.com/segmented/v2ray_config/master/certs/v2ray.key
wget https://raw.githubusercontent.com/segmented/v2ray_config/master/cfgs/config.json

systemctl daemon-reload
systemctl restart v2ray

#add ss
curl https://raw.githubusercontent.com/segmented/shadowsocks_install/master/shadowsocks.sh | bash
source ~/.bashrc
/etc/init.d/shadowsocks restart
