#!/bin/bash

source /opt/panjerd/VARS.sh


#    DIT IS DE BREEDTE    #

while `true`; do
	clear
	echo -e "       ${BLUE}${ON_RED}Advertisement${RESET}\n"
	
	FILE=$(find "${ADVERTDIR}" -iregex ".*\(txt\)" | sort -R | head -1)
	
	if [ -e "${FILE}" ]; then
		echo "Running free!"
	else
		cat "$FILE"
	fi
	
	sleep $WAITTIME_ADVERT
done

