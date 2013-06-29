#!/bin/bash

# http://www.armhf.com/index.php/using-beaglebone-black-gpios/
# pin 9:11, gpio0[30] -> 0 + 30 = 30
# pin 9:13, gpio0[31] -> 0 + 30 = 31

echo 30 > /sys/class/gpio/export
echo 31 > /sys/class/gpio/export
echo in > /sys/class/gpio/gpio30/direction
echo in > /sys/class/gpio/gpio31/direction

while [ 1 ] ; do 
	MOUSE1=`cat /sys/class/gpio/gpio30/value`
	MOUSE2=`cat /sys/class/gpio/gpio31/value`

	if [ $MOUSE1 -eq 1 ] ; then
		echo "Trap 1 tripped"
	else
		echo "Trap 1 set"
	fi

	if [ $MOUSE2 -eq 1 ] ; then
		echo "Trap 2 tripped"
	else
		echo "Trap 2 set"
	fi

	sleep 5
	echo
done
