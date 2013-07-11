#!/bin/bash

# http://www.armhf.com/index.php/using-beaglebone-black-gpios/
# pin 9:11, gpio0[30] -> 00 + 30 = 30
# pin 9:13, gpio0[31] -> 00 + 31 = 31
# pin 9:19, gpio0[13] -> 00 + 13 = 13
# pin 9:25, gpio3[21] -> 96 + 21 = 117

echo 30 > /sys/class/gpio/export
echo 31 > /sys/class/gpio/export
echo 13 > /sys/class/gpio/export
echo 117 > /sys/class/gpio/export
echo in > /sys/class/gpio/gpio30/direction
echo in > /sys/class/gpio/gpio31/direction
echo in > /sys/class/gpio/gpio13/direction
echo in > /sys/class/gpio/gpio117/direction

while [ 1 ] ; do 
	MOUSE1=`cat /sys/class/gpio/gpio30/value`
	MOUSE2=`cat /sys/class/gpio/gpio31/value`
	MOUSE3=`cat /sys/class/gpio/gpio13/value`
	MOUSE4=`cat /sys/class/gpio/gpio117/value`

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

	if [ $MOUSE3 -eq 1 ] ; then
		echo "Trap 3 tripped"
	else
		echo "Trap 3 set"
	fi

	if [ $MOUSE4 -eq 1 ] ; then
		echo "Trap 4 tripped"
	else
		echo "Trap 4 set"
	fi

	sleep 5
	echo
done
