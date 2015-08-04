#!/bin/bash

NORMAL=$(/usr/bin/figlet -c "PANJERD" -f /usr/share/figlet/block.flf | sed '/^ *$/d')
BROKEN=$(/usr/bin/figlet -c "PANJERD" -f /usr/share/figlet/lean.flf | sed '/^ *$/d')


function bork {

        TITLESHAKETIMES=12
        shakes=$RANDOM
        let "shakes %= $TITLESHAKETIMES"


	for i in {1..$shakes}; do
		clear
		echo "$BROKEN"
		sleep 0.08

		clear
		echo "$NORMAL"
		sleep 0.08
	done

}

	

while `true`; do
	clear
	
        echo "$NORMAL"


	TITLEBORKCHANCE=10

	number=$RANDOM
	let "number %= $TITLEBORKCHANCE"
	sleep $number
	
	bork

done
