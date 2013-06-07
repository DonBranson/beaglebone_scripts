#!/bin/bash

# http://www.armhf.com/index.php/using-beaglebone-black-gpios/
# pin 9:11, gpio0[30] -> 0 + 30 = 30
echo 30 > /sys/class/gpio/export
echo in > /sys/class/gpio/gpio30/direction

# 1=switch open; 0=switch closed
while [ 1 ] ; do cat /sys/class/gpio/gpio30/value ; sleep .5 ; done

