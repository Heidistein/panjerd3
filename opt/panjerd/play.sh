#!/bin/bash

source /opt/panjerd/VARS.sh


while `true`; do
	nice -n -15 /usr/bin/aplay -f cd -V stereo --fatal-errors "${DECODEPIPE}"
	echo -n "FOUT: De PANJERD speler is gebroken! Opnieuw proberen..."
	sleep 1
done

