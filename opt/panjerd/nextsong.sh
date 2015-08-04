#!/bin/bash

## Dit dynamisch maken
CHANNEL="${STATIONDIR}/$(cat ${STATIONFILE})"

if [[ ! -e "${BASEDIR}${CHANNEL}${MUSIC}" ]]; then
	echo "ERROR Station ${CHANNEL} has no music."
	exit 1
fi

if [[ ! -e "${BASEDIR}${CHANNEL}${ADVER}" ]]; then
        echo "WARNING Station ${CHANNEL} has no commercials." > 2
fi

FILE=$(find "${CHANNEL}${MUSIC}" -iregex ".*\(ogg\|mp3\|wav\|flac\|wma\|m4a\)" | sort -R | head -1)

echo $FILE

