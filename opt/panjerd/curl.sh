#!/bin/bash

source /opt/panjerd/VARS.sh

if [[ ! -p "${CURLPIPE}" ]]; then
	rm -f "${CURLPIPE}"
	/usr/bin/mkfifo "${CURLPIPE}"
fi

if [[ ! -p "${CURLPIPE}" ]]; then
	echo -n "ERROR: Could not create curl fifo!"
	exit 1
fi


while `true`; do
	echo -e "${GREEN}Starting stream"
	curl -s "${STREAMURL}" | tee -a "${CURLPIPE}" | hexdump -e '" | " 8/1 "%02X " " |\n"'
	echo -ne "${RED}FOUT: De PANJERD stream is gebroken! Opnieuw proberen..."
	sleep 0.2
done

