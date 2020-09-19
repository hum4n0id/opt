#!/bin/bash
# echo "Disabling LED0 (Green)"
# echo 0 > /sys/class/leds/led0/brightness
# touch /tmp/green_led0_off

echo "Disabling LED1 (Red)"
echo 0 > /sys/class/leds/led1/brightness
touch /tmp/red_led1_off

