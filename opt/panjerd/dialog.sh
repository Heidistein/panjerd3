#!/bin/bash

sleep 2
/opt/panjerd/termsize.py

STATION=2

while `true`; do
	exec 3>&1 
	STATION=$(dialog --nocancel --ok-label "PLAY" --default-item $STATION --menu "Choose Broadcast:" 15 35 7 1 Technomancer\ Radio 2 Zombie\ Radio 3 "Arjen Radio" 4 "Government broadcast"  2>&1 1>&3)
	clear

	killall -USR1 ezstream

	for i in $(seq 0 2 100) ; do sleep 0.08; echo $i | dialog --gauge "Please wait, tuning to station..." 10 40 0; done
done
