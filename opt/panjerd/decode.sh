#!/bin/bash

source /opt/panjerd/VARS.sh

if [[ ! -p "${DECODEPIPE}" ]]; then
	/usr/bin/mkfifo "${DECODEPIPE}"
fi


if [[ ! -p "${DECODEPIPE}" ]]; then
        echo -n "ERROR: Could not create decode fifo!"
	exit 1
fi


while `true`; do
	/usr/bin/mplayer "${CURLPIPE}" -af volnorm=2:0.90 -cache 8192 -ao pcm:file=${DECODEPIPE}
	echo -n "FOUT: De PANJERD decoder is gebroken! Opnieuw proberen..."
	sleep 0.2
done

