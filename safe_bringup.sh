#!/bin/bash

if rosnode list | grep "battery_monitor" > /dev/null
then
  echo 'bringup_mbot is already running, please close this before calling again'
else
  roslaunch mbot_bringup robot.launch
fi
