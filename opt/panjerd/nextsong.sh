#!/bin/bash

source /opt/panjerd/VARS.sh

## Dit dynamisch maken
CHANNEL="${STATIONDIR}/$(cat ${STATIONFILE})"

if [ ! -e "${STATIONFILE}" ]; then
	## Station not yet available. Picking random one"
	CHANNEL="${STATIONDIR}/$(ls -1 ${STATIONDIR} | sort -R | head -1)"
fi

if [[ ! -e "${BASEDIR}${CHANNEL}${MUSIC}" ]]; then
	echo "ERROR Station ${CHANNEL} has no music."
	exit 1
fi

if [[ ! -e "${BASEDIR}${CHANNEL}${ADVER}" ]]; then
        echo "WARNING Station ${CHANNEL} has no commercials." > 2
fi

if [ $((RANDOM%${CHANCE_ADV}+1)) -eq 1 ]; then
	## Commercial
	FILE=$(find "${CHANNEL}${ADVER}" -iregex ".*\(ogg\|mp3\|wav\|flac\|wma\|m4a\)" | sort -R | head -1)
elif [ $((RANDOM%${CHANCE_NWS}+1)) -eq 1 ]; then
	## NEWS
	FILE=$(find "${CHANNEL}${NEWS}" -iregex ".*\(ogg\|mp3\|wav\|flac\|wma\|m4a\)" | sort -R | head -1)
else
	FILE=$(find "${CHANNEL}${MUSIC}" -iregex ".*\(ogg\|mp3\|wav\|flac\|wma\|m4a\)" | sort -R | head -1)
fi

echo $FILE

