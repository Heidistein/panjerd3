#!/bin/bash

source /opt/panjerd/VARS.sh



while `true`; do
	killall -9 ezstream
	/usr/bin/ezstream -c /opt/panjerd/ezstream.xml
	echo -n "FOUT: De PANJERD stream is gebroken! Opnieuw proberen..."
	sleep 5
done

