#!/bin/bash

# http://www.armhf.com/index.php/using-beaglebone-black-gpios/
# pin 9:11, gpio0[30] -> 0 + 30 = 30
echo 30 > /sys/class/gpio/export
echo in > /sys/class/gpio/gpio30/direction

while [ 1 ] ; do 
	SWITCH=`cat /sys/class/gpio/gpio30/value`
	if [ $SWITCH -eq 1 ] ; then
		echo "Freezer open"
	else
		echo "Freezer closed"
	fi
	sleep 1
done
