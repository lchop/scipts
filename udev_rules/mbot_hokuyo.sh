#!/bin/bash

# indicate which hokuyo ID is front and which is back
FRONT="H1400316" # 5m hokuyo 1
REAR="H1004274" # 30m hokuyo 1
LOG_FILE="${HOME}/.ros/mbot_hokuyo_sh.log"

# delete old log info
rm $HOME/.ros/mbot_hokuyo_sh.log

# log information to a file (this is a function)
hokuyo_log()
{
    printf '[mbot_hokuyo] : ' >> $LOG_FILE
    for each in $@
    do
        printf $each >> $LOG_FILE
        printf ' ' >> $LOG_FILE
    done
    printf '\n' >> $LOG_FILE
}

# check if commandline args are received, exit if not
if [ "${1}" == "" ]; then
  hokuyo_log Usage example: ./mbot_hokuyo /dev/ttyACM0
  # terminate and indicate error
  exit 1
fi

hokuyo_log Trying to read ID for device ${1}

#sleep 1

# get hokuyo ID with 1 sec timeout
hokuyoID=`timeout 1 /opt/ros/indigo/lib/hokuyo_node/getID $1 q`
hokuyo_log detected hokuyo ID ${hokuyoID}

# match hokuyo against known sensor ID's
if [ "$hokuyoID" == "$FRONT" ]; then
  echo "front"
  hokuyo_log front
elif [ "$hokuyoID" == "$REAR" ]; then
  echo "rear"
  hokuyo_log rear
else
  hokuyo_log Failed to recognize hokuyo ID
  # terminate and indicate error
  exit 1
fi

# udev will get the echo value from this script and will
# provide with a unique sensor name base on ID
