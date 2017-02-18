#!/bin/bash

source /opt/ros/indigo/setup.bash
logger "mbot_hokuyo: Trying to read Id for device "$1
sleep 1
res=`/opt/ros/indigo/lib/hokuyo_node/getID $1 q`
rc=$?
if [[ $rc != 0 ]] ; then
  logger "mbot_hokuyo: Failed to get Id for device "$1 " : " $rc
  res=`/opt/ros/indigo/lib/hokuyo_node/getID $1 q`
  rc=$?
  if [[ $rc != 0 ]] ; then
    logger "mbot_hokuyo: Failed to get Id for device "$1 " : " $rc
    exit $rc
  fi
fi
logger "mbot_hokuyo: Finished reading Id for device"$1 " : " $res
echo $res | sed -f /home/socrob/scripts/udev_rules/hokuyo_table.sed
