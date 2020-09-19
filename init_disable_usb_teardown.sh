#!/bin/bash
echo "Cleaning up USB status files"
if [ -f /tmp/usb_drives_off ]; then
    rm /tmp/usb_drives_off
if [ -f /tmp/usb_1_1_off ]; then
    rm /tmp/usb_1_1_off
if [ -f /tmp/usb_2_off ]; then
    rm /tmp/usb_2_off

