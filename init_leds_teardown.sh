#!/bin/bash
echo "Cleaning up led status files"
if [ -f /tmp/green_led0_off ]; then
    rm /tmp/green_led0_off
if [ -f /tmp/red_led1_off ]; then
    rm /tmp/red_led1_off

