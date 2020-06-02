#!/bin/sh

MODEL=$(cat /proc/device-tree/model)
CUT_MODEL=$(echo $MODEL | cut -c -14)

Rpi1="Raspberry Pi M"
Rpi2="Raspberry Pi 2"
Rpi3="Raspberry Pi 3"
Rpi4="Raspberry Pi 4"

RED='\033[0;31m'
GREEN='\032[0;31m'
NC='\033[0m' # No Color

CONFIG=""

if [ "$1" = "sysfsgpio" ]; then
	CONFIG="sysfsgpio-raspberrypi.cfg"
	echo "***********************************************************************************"
	echo "* You choose sysfsgpio config."
	echo "***********************************************************************************"
else

	if [ "$CUT_MODEL" = "$Rpi1" ]; then
		CONFIG="raspberrypi-native.cfg"
	elif [ "$CUT_MODEL" = "$Rpi2" ]; then
		CONFIG="raspberrypi2-native.cfg"
	elif [ "$CUT_MODEL" = "$Rpi3" ]; then
		CONFIG="raspberrypi2-native.cfg"
	elif [ "$CUT_MODEL" = "$Rpi4" ]; then
		CONFIG="raspberrypi4-native.cfg"
		echo "***********************************************************************************"
		echo "* ${RED}It is an experimental config for Raspberry Pi 4. If It doesn't work, use ${GREEN}sysgpio ${RED}argument for this script:${NC}"
		echo "***********************************************************************************"
	else
		echo "***********************************************************************************"
		echo "* ${RED}Unknown Rasperry board. Please report the error to support@remotemcu.com email${NC}"
		echo "***********************************************************************************"
		exit 1
	fi
fi

CONFIG_RASPBERRY=${CONFIG}
