#!/bin/bash

cd "$(dirname "$0")"

git pull

cp -rf opt/ /
cp -rf home/ /
cp -rf etc/ /
#cp -rf lib/ /

apt-get update
apt-get install hostapd dnsmasq apache2 firmware-realtek wireless-tools wpasupplicant exfat-utils exfat-fuse ntfs-3g autofs5