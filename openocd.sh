#!/bin/sh

. /home/pi/raspberry_pi.sh

INTERFACE_CONFIG="-f openocd/share/openocd/scripts/interface/${CONFIG_RASPBERRY}"
TRANSPORT="transport select swd"
TARGET='-f openocd/share/openocd/scripts/target/stm32f1x.cfg'

sudo openocd/bin/openocd ${INTERFACE_CONFIG} -c "$TRANSPORT" ${TARGET}
