#!/bin/bash

source /opt/panjerd/VARS.sh


while `true`; do
	/usr/bin/aplay -f cd -V stereo --fatal-errors "${DECODEPIPE}"
	echo -n "FOUT: De PANJERD speler is gebroken! Opnieuw proberen..."
	sleep 0.2
done

