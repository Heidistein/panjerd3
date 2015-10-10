#!/bin/bash

source /opt/panjerd/VARS.sh


# Jaja... De credits header is iig: ICAbWzA7MzRtG1s0Mm0gLSA9ICBDIFIgRSBEIEkgVCBTICA9IC0gG1swbQoK 
CREDITS="ICAbWzA7MzRtG1s0Mm0gLSA9ICBDIFIgRSBEIEkgVCBTICA9IC0gG1swbQoKICAgICAgICBQIEEgTiBKIEUgUiBECiBJcyBwcm91ZGx5IHByZXNlbnRlZCB0byB5b3UKICAgICBieSB0aGUgUEFOSkVSRCB0ZWFtCiwtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnxCb3NzIFcgIC0gQ3B0IENhdGVyaW5nICAgICB8CnxKb2JhbWJpIC0gTGUgUGV0aXQgQ2FwaXRhaW58CnxNci4gTWFuIC0gSGFubmliYWwgICAgICAgICB8CmAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0nCg=="

#    DIT IS DE BREEDTE    #

while `true`; do
	clear
	echo -e "        ${BLUE}${ON_RED}Advertisement${RESET}\n"
	
	FILE=$(find "${ADVERTDIR}" -iregex ".*\(txt\)" | sort -R | head -1)
	
	## Hardcoded chance on displaying the credits
	if [ $((RANDOM%20+1)) -eq 1 ]; then
		echo ${CREDITS} | base64 -d
	elif [ -e "${FILE}" ]; then
		cat "$FILE" | head -9 | cut -c 29
	else
		echo "Running free!"
	fi
	
	sleep $WAITTIME_ADVERT
done

