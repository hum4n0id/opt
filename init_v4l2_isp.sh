#!/bin/bash
echo "Init V4L2 ISP"


# ircut
v4l2-ctl -d 0 -c ircut=1
sleep .1s
v4l2-ctl -d 0 -c ircut=0
sleep .1s


# white_balance_automatic
v4l2-ctl -d 0 -c white_balance_automatic=1
sleep .1s
v4l2-ctl -d 0 -c white_balance_automatic=0
sleep .1s


# exposure_auto
v4l2-ctl -d 0 -c exposure_auto=1
sleep .1s
v4l2-ctl -d 0 -c exposure_auto=0
sleep .1s


# contrast
v4l2-ctl -d 0 -c contrast=7933
sleep .1s
v4l2-ctl -d 0 -c contrast=1283
sleep .1s


# saturation
v4l2-ctl -d 0 -c saturation=3455
sleep .1s
v4l2-ctl -d 0 -c saturation=0
sleep .1s


# gamma
v4l2-ctl -d 0 -c gamma=7548 
sleep .1s
v4l2-ctl -d 0 -c gamma=1300
sleep .1s


# exposure
v4l2-ctl -d 0 -c exposure=50000
sleep .1s
v4l2-ctl -d 0 -c exposure=228379
sleep .1s


# gain
v4l2-ctl -d 0 -c gain=1
sleep .1s
v4l2-ctl -d 0 -c gain=3
sleep .1s


# white_balance_temperature
v4l2-ctl -d 0 -c white_balance_temperature=6500
sleep .1s
v4l2-ctl -d 0 -c white_balance_temperature=2300
sleep .1s


# sharpness
v4l2-ctl -d 0 -c sharpness=20752
sleep .1s
v4l2-ctl -d 0 -c sharpness=11374
sleep .1s


# denoise
v4l2-ctl -d 0 -c denoise=7
sleep .1s
v4l2-ctl -d 0 -c denoise=6

touch /tmp/v4l2_isp_init

