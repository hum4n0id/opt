#!/bin/bash
echo "Cleaning up v4l2 isp status files"
if [ -f /tmp/init_v4l2_isp ]; then
    rm /tmp/init_v4l2_isp
else
    echo "ISP never initd: Skipping ..."
fi

