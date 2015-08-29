#!/bin/bash


#VOLNORM="-af volnorm=2:0.25"
#/usr/bin/mplayer "$1" ${VOLNORM} -ao pcm:file=/dev/stdout -quiet -really-quiet 

sox "$1" -t .raw - 


