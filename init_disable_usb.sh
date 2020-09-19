#!/bin/bash
echo "Unmounting USB Drives"
udisksctl power-off --block-device /dev/sda
touch /tmp/usb_drives_off

echo "Disabling Usb 1_1"
uhubctl -l 1-1 -a off
touch /tmp/usb_1_1_off

echo "Disabling Usb 2"
uhubctl -l 2 -a off
touch /tmp/usb_2_off
