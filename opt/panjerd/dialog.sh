#!/bin/bash

source /opt/panjerd/VARS.sh

sleep 2
/opt/panjerd/termsize.py

STATION=2

STATION_NUMBERS=()
STATION_NAMES=()
STATION_STRING=""

function collectStations {

		STATION_NUMBERS=()
		STATION_NAMES=()

		STATION_STRING=""

		## Put the files/stations in a list
		SAVEIFS=$IFS
		IFS=$(echo -en "\n\b")
		for f in ${STATIONDIR}/*; do

				BNAME=$(basename $f)

				#Chop of the number and name
				NUMBER=$(echo "$BNAME" | sed -e's/\([0-9]\{2\}\)_.*/\1/' -e 's/^0*//')
				NAME=$(echo "$BNAME" | sed -e's/[0-9]\{2\}_\(.*\)/\1/')

				#Check if it indied is a number
				if [[ $NUMBER =~ ^[0-9]+$ ]]; then
						STATION_NAMES[$NUMBER]=$BNAME
						STATION_STRING="$STATION_STRING $NUMBER \"$NAME\""
				fi
		done
		IFS=$SAVEIFS
}

function showMenu {
		exec 3>&1
		BLA="dialog --nocancel --ok-label 'PLAY' --default-item $STATION --menu 'Choose Broadcast:' 15 40 7 ${STATION_STRING} 2>&1 1>&3"
		STATION=$(eval ${BLA})

}

function randomStation {
	
	TMPFILE=$(mktemp)
	
	for i in "${!STATION_NAMES[@]}"; do   
		echo "$i" >> $TMPFILE
	done
	
	STATION=$(cat "$TMPFILE" | sort -R | head -1)
	
	rm -f "$TMPFILE"
}

function setStation {
	echo "${STATION_NAMES[${STATION}]}" > "$STATIONFILE"
}

function tuneStation {
	for i in $(seq 0 3 100) ; do sleep 0.05; echo $i | dialog --gauge "Please wait, tuning to station..." 10 40 0; done
}

## Before going into the loop, first tune into a station
tuneStation

while `true`; do

		collectStations
		
		# Check if the folder from that is in the stationfile has a music folder.
		if [ ! -d "$STATIONDIR/$(cat $STATIONFILE)/music" ]; then
			randomStation
			setStation
		fi
		
		showMenu
		
		setStation
		
		clear

		killall -USR1 ezstream

		tuneStation
done

